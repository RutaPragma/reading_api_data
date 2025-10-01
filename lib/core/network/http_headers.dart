class HttpHeaders {
  static Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Map<String, String> withAuth(String token) => {
    ...defaultHeaders,
    'Authorization': 'Bearer $token',
  };
}
