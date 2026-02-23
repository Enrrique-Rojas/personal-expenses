// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_expense.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonalExpenseEntity _$PersonalExpenseEntityFromJson(
    Map<String, dynamic> json) {
  return _PersonalExpense.fromJson(json);
}

/// @nodoc
mixin _$PersonalExpenseEntity {
  String get label => throw _privateConstructorUsedError;
  num get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  bool? get isFavorite => throw _privateConstructorUsedError;
  bool? get isDeleted => throw _privateConstructorUsedError;
  bool? get isSync => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  DateTime? get lastModified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalExpenseEntityCopyWith<PersonalExpenseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalExpenseEntityCopyWith<$Res> {
  factory $PersonalExpenseEntityCopyWith(PersonalExpenseEntity value,
          $Res Function(PersonalExpenseEntity) then) =
      _$PersonalExpenseEntityCopyWithImpl<$Res, PersonalExpenseEntity>;
  @useResult
  $Res call(
      {String label,
      num amount,
      String currency,
      DateTime date,
      String category,
      String code,
      bool? isFavorite,
      bool? isDeleted,
      bool? isSync,
      String? createdBy,
      DateTime? created,
      String? lastModifiedBy,
      DateTime? lastModified});
}

/// @nodoc
class _$PersonalExpenseEntityCopyWithImpl<$Res,
        $Val extends PersonalExpenseEntity>
    implements $PersonalExpenseEntityCopyWith<$Res> {
  _$PersonalExpenseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? category = null,
    Object? code = null,
    Object? isFavorite = freezed,
    Object? isDeleted = freezed,
    Object? isSync = freezed,
    Object? createdBy = freezed,
    Object? created = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSync: freezed == isSync
          ? _value.isSync
          : isSync // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalExpenseImplCopyWith<$Res>
    implements $PersonalExpenseEntityCopyWith<$Res> {
  factory _$$PersonalExpenseImplCopyWith(_$PersonalExpenseImpl value,
          $Res Function(_$PersonalExpenseImpl) then) =
      __$$PersonalExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      num amount,
      String currency,
      DateTime date,
      String category,
      String code,
      bool? isFavorite,
      bool? isDeleted,
      bool? isSync,
      String? createdBy,
      DateTime? created,
      String? lastModifiedBy,
      DateTime? lastModified});
}

/// @nodoc
class __$$PersonalExpenseImplCopyWithImpl<$Res>
    extends _$PersonalExpenseEntityCopyWithImpl<$Res, _$PersonalExpenseImpl>
    implements _$$PersonalExpenseImplCopyWith<$Res> {
  __$$PersonalExpenseImplCopyWithImpl(
      _$PersonalExpenseImpl _value, $Res Function(_$PersonalExpenseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? category = null,
    Object? code = null,
    Object? isFavorite = freezed,
    Object? isDeleted = freezed,
    Object? isSync = freezed,
    Object? createdBy = freezed,
    Object? created = freezed,
    Object? lastModifiedBy = freezed,
    Object? lastModified = freezed,
  }) {
    return _then(_$PersonalExpenseImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as num,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: freezed == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      isDeleted: freezed == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSync: freezed == isSync
          ? _value.isSync
          : isSync // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModified: freezed == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalExpenseImpl implements _PersonalExpense {
  const _$PersonalExpenseImpl(
      {required this.label,
      required this.amount,
      required this.currency,
      required this.date,
      required this.category,
      required this.code,
      this.isFavorite,
      this.isDeleted,
      this.isSync,
      this.createdBy,
      this.created,
      this.lastModifiedBy,
      this.lastModified});

  factory _$PersonalExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalExpenseImplFromJson(json);

  @override
  final String label;
  @override
  final num amount;
  @override
  final String currency;
  @override
  final DateTime date;
  @override
  final String category;
  @override
  final String code;
  @override
  final bool? isFavorite;
  @override
  final bool? isDeleted;
  @override
  final bool? isSync;
  @override
  final String? createdBy;
  @override
  final DateTime? created;
  @override
  final String? lastModifiedBy;
  @override
  final DateTime? lastModified;

  @override
  String toString() {
    return 'PersonalExpenseEntity(label: $label, amount: $amount, currency: $currency, date: $date, category: $category, code: $code, isFavorite: $isFavorite, isDeleted: $isDeleted, isSync: $isSync, createdBy: $createdBy, created: $created, lastModifiedBy: $lastModifiedBy, lastModified: $lastModified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalExpenseImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.isSync, isSync) || other.isSync == isSync) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      label,
      amount,
      currency,
      date,
      category,
      code,
      isFavorite,
      isDeleted,
      isSync,
      createdBy,
      created,
      lastModifiedBy,
      lastModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalExpenseImplCopyWith<_$PersonalExpenseImpl> get copyWith =>
      __$$PersonalExpenseImplCopyWithImpl<_$PersonalExpenseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalExpenseImplToJson(
      this,
    );
  }
}

abstract class _PersonalExpense implements PersonalExpenseEntity {
  const factory _PersonalExpense(
      {required final String label,
      required final num amount,
      required final String currency,
      required final DateTime date,
      required final String category,
      required final String code,
      final bool? isFavorite,
      final bool? isDeleted,
      final bool? isSync,
      final String? createdBy,
      final DateTime? created,
      final String? lastModifiedBy,
      final DateTime? lastModified}) = _$PersonalExpenseImpl;

  factory _PersonalExpense.fromJson(Map<String, dynamic> json) =
      _$PersonalExpenseImpl.fromJson;

  @override
  String get label;
  @override
  num get amount;
  @override
  String get currency;
  @override
  DateTime get date;
  @override
  String get category;
  @override
  String get code;
  @override
  bool? get isFavorite;
  @override
  bool? get isDeleted;
  @override
  bool? get isSync;
  @override
  String? get createdBy;
  @override
  DateTime? get created;
  @override
  String? get lastModifiedBy;
  @override
  DateTime? get lastModified;
  @override
  @JsonKey(ignore: true)
  _$$PersonalExpenseImplCopyWith<_$PersonalExpenseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
