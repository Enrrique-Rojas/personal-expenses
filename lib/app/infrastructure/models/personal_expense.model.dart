import 'package:personal_expenses/app/common/models/list.model.dart';
import 'package:personal_expenses/app/common/models/pagination.model.dart';
import 'package:personal_expenses/app/domain/entities/personal_expense/personal_expense.entity.dart';

class PersonalExpenseModel {
  final String code;
  final String? category;
  final DateTime? date;
  final String? currency;
  final num? amount;
  final String? label;
  final bool isFavorite;
  final bool isDeleted;
  final bool isSync;
  final String? createdBy;
  final DateTime? created;
  final String? lastModifiedBy;
  final DateTime? lastModified;

  const PersonalExpenseModel({
    required this.code,
    this.category,
    this.date,
    this.currency,
    this.amount,
    this.label,
    this.isFavorite = false,
    this.isDeleted = false,
    this.isSync = false,
    this.createdBy,
    this.created,
    this.lastModifiedBy,
    this.lastModified,
  });

  factory PersonalExpenseModel.fromJson(dynamic json) => PersonalExpenseModel(
      code: json['code'],
      category: json['category'],
      date: DateTime.tryParse(json['date'] ?? ''),
      currency: json['currency'],
      amount: json['amount'],
      label: json['label'],
      isFavorite: json['isFavorite'] == 1,
      createdBy: json['createdBy'],
      created: DateTime.tryParse(json['created']),
      lastModifiedBy: json['lastModifiedBy'],
      lastModified: DateTime.tryParse(json['lastModified'] ?? ''));

  static List<PersonalExpenseModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => PersonalExpenseModel.fromJson(json)).toList();

  static PaginationModel<PersonalExpenseModel> fromJsonPaginated(
      Map<String, dynamic> jsonMap) {
    return PaginationModel<PersonalExpenseModel>(
        pageNumber: jsonMap['pageNumber'],
        pageSize: jsonMap['pageSize'],
        totalRecord: jsonMap['totalRecord'],
        list: fromJsonList(jsonMap['list']));
  }

  static ListModel<PersonalExpenseModel> fromJsonMapToList(
      Map<String, dynamic> jsonMap) {
    return ListModel<PersonalExpenseModel>(
        totalRecord: jsonMap['totalRecord'],
        list: fromJsonList(jsonMap['list']));
  }

  PersonalExpenseModel copyWith({
    String? code,
    String? category,
    DateTime? date,
    String? currency,
    num? amount,
    String? label,
    bool? isFavorite,
    bool? isDeleted,
    bool? isSync,
    String? createdBy,
    DateTime? created,
    String? lastModifiedBy,
    DateTime? lastModified,
  }) {
    return PersonalExpenseModel(
      code: code ?? this.code,
      category: category ?? this.category,
      date: date ?? this.date,
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      label: label ?? this.label,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
      isSync: isSync ?? this.isSync,
      createdBy: createdBy ?? this.createdBy,
      created: created ?? this.created,
      lastModifiedBy: lastModifiedBy ?? this.lastModifiedBy,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['code'] = code;
    json['category'] = category;
    json['date'] = date;
    json['currency'] = currency;
    json['amount'] = amount;
    json['label'] = label;
    json['isFavorite'] = isFavorite;
    return json;
  }

  Map<String, dynamic> toMapTable() {
    final Map<String, dynamic> json = {};
    json['code'] = code;
    json['category'] = category;
    json['date'] = date?.toIso8601String();
    json['currency'] = currency;
    json['amount'] = amount;
    json['label'] = label;
    json['isFavorite'] = isFavorite == true ? 1 : 0;
    json['isDeleted'] = isDeleted == true ? 1 : 0;
    json['isSync'] = isSync == true ? 1 : 0;
    json['createdBy'] = createdBy;
    json['created'] = created?.toIso8601String();
    if (lastModifiedBy != null) {
      json['lastModifiedBy'] = lastModifiedBy;
    }
    if (lastModified != null) {
      json['lastModified'] = lastModified!.toIso8601String();
    }
    return json;
  }

  factory PersonalExpenseModel.castFromEntity(PersonalExpenseEntity entity) {
    return PersonalExpenseModel(
      code: entity.code,
      category: entity.category,
      date: entity.date,
      currency: entity.currency,
      amount: entity.amount,
      label: entity.label,
      isFavorite: entity.isFavorite ?? false,
      isDeleted: entity.isDeleted ?? false,
      isSync: entity.isSync ?? true,
      createdBy: entity.createdBy,
      created: entity.created,
      lastModifiedBy: entity.lastModifiedBy,
      lastModified: entity.lastModified,
    );
  }

  factory PersonalExpenseModel.fromFirestoreRest(Map<String, dynamic> json) {
    final fields = json['fields'] ?? {};

    return PersonalExpenseModel(
      code: fields['code']?['stringValue'] ?? '',
      amount:
          double.tryParse(fields['amount']?['doubleValue']?.toString() ?? '0'),
      label: fields['label']?['stringValue'] ?? '',
      category: fields['category']?['stringValue'],
      date: DateTime.tryParse(fields['date']?['stringValue'] ?? ''),
      currency: fields['currency']?['stringValue'],
      createdBy: fields['createdBy']?['stringValue'],
      created: DateTime.tryParse(fields['created']?['stringValue'] ?? ''),
      lastModifiedBy: fields['lastModifiedBy']?['stringValue'],
      lastModified:
          DateTime.tryParse(fields['lastModified']?['stringValue'] ?? ''),
    );
  }

  Map<String, dynamic> toFirestoreRestJson() {
    final fields = <String, dynamic>{};
    fields["code"] = {"stringValue": code};
    if (amount != null) fields["amount"] = {"doubleValue": amount};
    if (label != null) fields["label"] = {"stringValue": label};
    if (category != null) fields["category"] = {"stringValue": category};
    if (date != null) fields["date"] = {"stringValue": date!.toIso8601String()};
    if (currency != null) fields["currency"] = {"stringValue": currency};
    if (createdBy != null) fields["createdBy"] = {"stringValue": createdBy};
    if (created != null) fields["created"] = {"stringValue": created!.toIso8601String()};
    if (lastModifiedBy != null) fields["lastModifiedBy"] = {"stringValue": lastModifiedBy};
    if (lastModified != null) fields["lastModified"] = {"stringValue": lastModified!.toIso8601String()};
    return {"fields": fields};
  }
}
