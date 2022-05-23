class JsonParseException implements Exception {
  final String message;

  const JsonParseException({
    required this.message,
  });

  @override
  String toString() => message;
}
