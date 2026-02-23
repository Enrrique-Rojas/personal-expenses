// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_expense.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalExpenseImpl _$$PersonalExpenseImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalExpenseImpl(
      label: json['label'] as String,
      amount: json['amount'] as num,
      currency: json['currency'] as String,
      date: DateTime.parse(json['date'] as String),
      category: json['category'] as String,
      code: json['code'] as String,
      isFavorite: json['isFavorite'] as bool?,
      isDeleted: json['isDeleted'] as bool?,
      isSync: json['isSync'] as bool?,
      createdBy: json['createdBy'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      lastModifiedBy: json['lastModifiedBy'] as String?,
      lastModified: json['lastModified'] == null
          ? null
          : DateTime.parse(json['lastModified'] as String),
    );

Map<String, dynamic> _$$PersonalExpenseImplToJson(
        _$PersonalExpenseImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'amount': instance.amount,
      'currency': instance.currency,
      'date': instance.date.toIso8601String(),
      'category': instance.category,
      'code': instance.code,
      'isFavorite': instance.isFavorite,
      'isDeleted': instance.isDeleted,
      'isSync': instance.isSync,
      'createdBy': instance.createdBy,
      'created': instance.created?.toIso8601String(),
      'lastModifiedBy': instance.lastModifiedBy,
      'lastModified': instance.lastModified?.toIso8601String(),
    };
