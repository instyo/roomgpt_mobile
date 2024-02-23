import 'package:dio/dio.dart';
import 'package:roomgpt_mobile/models/replicate_response_model.dart';
import 'package:roomgpt_mobile/utils/constants.dart';

class ReplicateAPI {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.replicate.com/v1",
      headers: {
        "Authorization": "Token ${Constants.replicateApiKey}",
      },
    ),
  );

  Future<ReplicateResponseModel> createPrediction({
    required Map<String, dynamic> input,
  }) async {
    final response = await dio.post(
      "/predictions",
      data: {
        "version":
            "854e8727697a057c525cdb45ab037f64ecca770a1769cc52287c2e56472a247b",
        "input": input,
      },
    );

    return ReplicateResponseModel.fromMap(response.data);
  }

  Future<ReplicateResponseModel> getPrediction(String url) async {
    final response = await dio.getUri(
      Uri.parse(url),
    );

    return ReplicateResponseModel.fromMap(response.data);
  }
}
