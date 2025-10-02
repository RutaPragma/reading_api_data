class HttpHeaders {
  static final Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Header-test': 'application/json',
  };

  static Map<String, dynamic>? aditionalHeaders(
    Map<String, dynamic>? aditionalHeaders,
  ) => {...defaultHeaders, ...?aditionalHeaders};
}
