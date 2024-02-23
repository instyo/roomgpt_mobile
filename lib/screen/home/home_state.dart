import 'package:image_picker/image_picker.dart';
import 'package:roomgpt_mobile/models/base_state.dart';
import 'package:roomgpt_mobile/utils/state_status.dart';

class HomeState extends BaseState {
  final String resultUrl;
  final XFile? pickedImage;
  final String roomType;
  final String roomTheme;

  const HomeState({
    super.status = StateStatus.idle,
    super.errorMessage = "",
    this.resultUrl = "",
    this.pickedImage,
    this.roomType = "",
    this.roomTheme = "",
  });

  bool get isInputValid =>
      pickedImage != null && roomType.isNotEmpty && roomTheme.isNotEmpty;

  @override
  HomeState copyWith({
    StateStatus? status,
    String? errorMessage,
    String? resultUrl,
    Optional<XFile?>? pickedImage,
    String? roomType,
    String? roomTheme,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      resultUrl: resultUrl ?? this.resultUrl,
      pickedImage: pickedImage != null ? pickedImage.value : this.pickedImage,
      roomType: roomType ?? this.roomType,
      roomTheme: roomTheme ?? this.roomTheme,
    );
  }
}
