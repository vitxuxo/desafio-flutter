import 'package:desafio_flutter/shared/models/response_model.dart';
import 'package:dio/dio.dart';

class CustomIntercetors extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError e, ErrorInterceptorHandler handler) async {
    if (e.response!.statusCode == 400)
      return ResponseModel(
          sucess: false, errors: [e.response!.data['message']]);
    if (e.response!.statusCode == 404)
      return ResponseModel(
          sucess: false, errors: [e.response!.data['message']]);
    if (e.response!.statusCode == 422)
      return ResponseModel(
          sucess: false, errors: [e.response!.data['message']]);
    if (e.response!.statusCode == 500)
      return ResponseModel(
          sucess: false, errors: [e.response!.data['message']]);

    return ResponseModel(sucess: false);
  }
}
