import 'package:dio/dio.dart';

// import '../../shared/constants/backend_services_constants.dart'
//     as backend_services_constants;

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  final BaseOptions _options = BaseOptions(
    baseUrl: '', //backend_services_constants.baseUrl,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {}

  _onResponse(Response e) {
    print('######### Response Log');
    print(e.data);
    print('######### Response Log END');
  }

  _onError(DioError error) {
    throw error;
  }
}
