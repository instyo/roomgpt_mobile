import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roomgpt_mobile/api/imgbb_api.dart';
import 'package:roomgpt_mobile/api/replicate_api.dart';
import 'package:roomgpt_mobile/models/base_state.dart';
import 'package:roomgpt_mobile/screen/home/home_state.dart';
import 'package:roomgpt_mobile/utils/state_manager.dart';
import 'package:roomgpt_mobile/utils/state_status.dart';

class HomeManager extends StateManager<HomeState> {
  HomeManager() : super(const HomeState());

  final imagePicker = ImagePicker();
  final replicateApi = ReplicateAPI();
  final imageUploadApi = ImgbbAPI();

  Stream<({XFile? picked, String result})> get image$ {
    return stream
        .map(
          (state) => (
            picked: state.pickedImage,
            result: state.resultUrl,
          ),
        )
        .distinct();
  }

  Stream<String> get roomType$ {
    return stream.map((state) => state.roomType).distinct();
  }

  Stream<String> get roomTheme$ {
    return stream.map((state) => state.roomTheme).distinct();
  }

  Stream<StateStatus> get stateStatus$ {
    return stream.map((state) => state.status).distinct();
  }

  void reset() {
    emit(const HomeState());
  }

  void setRoomType(String roomType) {
    emit(
      state.copyWith(
        roomType: roomType,
      ),
    );
  }

  void setRoomTheme(String roomTheme) {
    emit(
      state.copyWith(
        roomTheme: roomTheme,
      ),
    );
  }

  void clearImage() {
    emit(
      state.copyWith(
        pickedImage: const Optional.value(null),
        resultUrl: "",
      ),
    );
  }

  Future<void> pickImage(ImageSource imageSource) async {
    try {
      final file = await imagePicker.pickImage(
        source: imageSource,
        imageQuality: 80,
        maxHeight: 1000,
      );
      
      if (file != null) {
        emit(
          state.copyWith(
            pickedImage: Optional.value(file),
          ),
        );
      }
    } catch (e) {
      debugPrint(">> Error occured on picking image : $e");
    }
  }

  Future<void> submitImage() async {
    if (!state.isInputValid) {
      return;
    }

    try {
      emit(
        state.copyWith(
          status: StateStatus.loading,
        ),
      );

      final imageUrl = await imageUploadApi.uploadImage(
        state.pickedImage!.path,
      );

      if (imageUrl == null) {
        throw Exception("Failed to upload image");
      }

      final prediction = await replicateApi.createPrediction(
        input: {
          "image": imageUrl,
          "prompt": state.roomType == "Gaming Room"
              ? "a room for gaming with gaming computers, gaming consoles, and gaming chairs"
              : "a ${state.roomTheme.toLowerCase()} ${state.roomType.toLowerCase()}",
          "a_prompt":
              "best quality, extremely detailed, photo from Pinterest, interior, cinematic photo, ultra-detailed, ultra-realistic, award-winning",
          "n_prompt":
              "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality",
        },
      );

      List<String>? outputs;

      // ignore: unnecessary_null_comparison
      while (outputs == null) {
        final latestPrediction = await replicateApi.getPrediction(
          prediction.urls.get,
        );

        switch (latestPrediction.status) {
          case "succeeded":
            outputs = latestPrediction.output;
            break;
          case "failed":
            throw Exception("Failed to get prediction");
          default:
            await Future.delayed(const Duration(seconds: 2));
        }
      }

      emit(
        state.copyWith(
          status: StateStatus.success,
          resultUrl: outputs.last,
        ),
      );
    } catch (e, stack) {
      debugPrint(">> Error : $e");
      debugPrint(">> Stack : $stack");
      emit(
        state.copyWith(
          status: StateStatus.error,
        ),
      );
    } finally {
      emit(
        state.copyWith(
          status: StateStatus.idle,
        ),
      );
    }
  }
}
