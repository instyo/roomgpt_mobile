import 'package:dio/dio.dart';
import 'package:roomgpt_mobile/utils/constants.dart';

class ImgbbAPI {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.imgbb.com/1",
    ),
  );

  Future<String?> uploadImage(
    String filePath, {
    int expirationTime = 60,
  }) async {
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(filePath),
    });

    final response = await dio.post(
      "/upload",
      queryParameters: {
        "expiration": expirationTime,
        "key": Constants.imgbbApiKey
      },
      data: formData,
    );

    return response.data["data"]?["medium"]?["url"] ??
        response.data["data"]?["image"]?["url"];
  }
}
