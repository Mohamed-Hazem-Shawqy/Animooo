abstract class ApiConsumer {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters, 
  });
  Future<dynamic> post({
    required String path,  
    required Object? data,
  });
  Future<dynamic> put({
    required String path,  
  });
  Future<dynamic> delete({
    required String path,  
    required Map<String, dynamic>? queryParameters,  
  });
}