class ResponseBase<T> {
  bool succeeded = false;
  String message = "";
  List<dynamic> errors = List.empty();
  T? data;
}
