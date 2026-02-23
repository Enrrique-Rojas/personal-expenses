class PaginateEntity {
  String? filterName;
  int pageNumber;
  int pageSize;
  PaginateEntity(
      {this.filterName,
      required this.pageNumber,
      required this.pageSize});
}
