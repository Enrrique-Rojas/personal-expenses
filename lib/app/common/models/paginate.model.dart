class PaginateModel {
  final String? filter;
  final int pageNumber;
  final int pageSize;

  PaginateModel({
    this.filter,
    required this.pageNumber,
    required this.pageSize,
  });

  int get offset => (pageNumber - 1) * pageSize;
}