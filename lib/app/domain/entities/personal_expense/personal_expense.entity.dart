import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_expense.entity.freezed.dart';
part 'personal_expense.entity.g.dart';

@freezed
class PersonalExpenseEntity with _$PersonalExpenseEntity {
  const factory PersonalExpenseEntity({
    required String label,
    required num amount,
    required String currency,
    required DateTime date,
    required String category,
    required String code,
    bool? isFavorite,
    bool? isDeleted,
    bool? isSync,
    String? createdBy,
    DateTime? created,
    String? lastModifiedBy,
    DateTime? lastModified,
  }) = _PersonalExpense;

  factory PersonalExpenseEntity.fromJson(Map<String, dynamic> json) =>
      _$PersonalExpenseEntityFromJson(json);
}
