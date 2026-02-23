class PaginationModel<T> {
  late final int? totalRecord;
  late final int? pageNumber;
  late final int? pageSize;
  late final List<T> list;

  PaginationModel({this.totalRecord, this.pageNumber, this.pageSize, required this.list});

  PaginationModel.init() {
    totalRecord = 0;
    pageNumber = 0;
    pageSize = 0;
    list = List.empty();
  }
}