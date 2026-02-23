class ListModel<T> {
  late final int? totalRecord;
  late final List<T> list;

  ListModel({this.totalRecord, required this.list});

  ListModel.init() {
    totalRecord = 0;
    list = List.empty();
  }
}
