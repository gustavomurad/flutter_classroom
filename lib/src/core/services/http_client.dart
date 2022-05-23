abstract class HttpClient {
  Future<Map<String, dynamic>> httpGet({
    required String path,
    Map<String, dynamic>? queryParameters,
  });

  Future<Map<String, dynamic>> httpsGet({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
}
