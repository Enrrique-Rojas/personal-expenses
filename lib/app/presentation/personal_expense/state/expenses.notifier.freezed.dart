// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses.notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpensesState {
  bool get canLoadMore => throw _privateConstructorUsedError;
  List<PersonalExpenseEntity> get items => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loading,
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loaded,
    required TResult Function(bool canLoadMore,
            List<PersonalExpenseEntity> items, String errorMessage)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpensesLoading value) loading,
    required TResult Function(_ExpensesLoaded value) loaded,
    required TResult Function(_ExpensesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExpensesLoading value)? loading,
    TResult? Function(_ExpensesLoaded value)? loaded,
    TResult? Function(_ExpensesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpensesLoading value)? loading,
    TResult Function(_ExpensesLoaded value)? loaded,
    TResult Function(_ExpensesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpensesStateCopyWith<ExpensesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesStateCopyWith<$Res> {
  factory $ExpensesStateCopyWith(
          ExpensesState value, $Res Function(ExpensesState) then) =
      _$ExpensesStateCopyWithImpl<$Res, ExpensesState>;
  @useResult
  $Res call({bool canLoadMore, List<PersonalExpenseEntity> items});
}

/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res, $Val extends ExpensesState>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoadMore = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpenseEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpensesLoadingImplCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory _$$ExpensesLoadingImplCopyWith(_$ExpensesLoadingImpl value,
          $Res Function(_$ExpensesLoadingImpl) then) =
      __$$ExpensesLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canLoadMore, List<PersonalExpenseEntity> items});
}

/// @nodoc
class __$$ExpensesLoadingImplCopyWithImpl<$Res>
    extends _$ExpensesStateCopyWithImpl<$Res, _$ExpensesLoadingImpl>
    implements _$$ExpensesLoadingImplCopyWith<$Res> {
  __$$ExpensesLoadingImplCopyWithImpl(
      _$ExpensesLoadingImpl _value, $Res Function(_$ExpensesLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoadMore = null,
    Object? items = null,
  }) {
    return _then(_$ExpensesLoadingImpl(
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpenseEntity>,
    ));
  }
}

/// @nodoc

class _$ExpensesLoadingImpl implements _ExpensesLoading {
  const _$ExpensesLoadingImpl(
      {required this.canLoadMore,
      required final List<PersonalExpenseEntity> items})
      : _items = items;

  @override
  final bool canLoadMore;
  final List<PersonalExpenseEntity> _items;
  @override
  List<PersonalExpenseEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ExpensesState.loading(canLoadMore: $canLoadMore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesLoadingImpl &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, canLoadMore, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesLoadingImplCopyWith<_$ExpensesLoadingImpl> get copyWith =>
      __$$ExpensesLoadingImplCopyWithImpl<_$ExpensesLoadingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loading,
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loaded,
    required TResult Function(bool canLoadMore,
            List<PersonalExpenseEntity> items, String errorMessage)
        failure,
  }) {
    return loading(canLoadMore, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
  }) {
    return loading?.call(canLoadMore, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(canLoadMore, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpensesLoading value) loading,
    required TResult Function(_ExpensesLoaded value) loaded,
    required TResult Function(_ExpensesFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExpensesLoading value)? loading,
    TResult? Function(_ExpensesLoaded value)? loaded,
    TResult? Function(_ExpensesFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpensesLoading value)? loading,
    TResult Function(_ExpensesLoaded value)? loaded,
    TResult Function(_ExpensesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ExpensesLoading implements ExpensesState {
  const factory _ExpensesLoading(
          {required final bool canLoadMore,
          required final List<PersonalExpenseEntity> items}) =
      _$ExpensesLoadingImpl;

  @override
  bool get canLoadMore;
  @override
  List<PersonalExpenseEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$ExpensesLoadingImplCopyWith<_$ExpensesLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpensesLoadedImplCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory _$$ExpensesLoadedImplCopyWith(_$ExpensesLoadedImpl value,
          $Res Function(_$ExpensesLoadedImpl) then) =
      __$$ExpensesLoadedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool canLoadMore, List<PersonalExpenseEntity> items});
}

/// @nodoc
class __$$ExpensesLoadedImplCopyWithImpl<$Res>
    extends _$ExpensesStateCopyWithImpl<$Res, _$ExpensesLoadedImpl>
    implements _$$ExpensesLoadedImplCopyWith<$Res> {
  __$$ExpensesLoadedImplCopyWithImpl(
      _$ExpensesLoadedImpl _value, $Res Function(_$ExpensesLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoadMore = null,
    Object? items = null,
  }) {
    return _then(_$ExpensesLoadedImpl(
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpenseEntity>,
    ));
  }
}

/// @nodoc

class _$ExpensesLoadedImpl implements _ExpensesLoaded {
  const _$ExpensesLoadedImpl(
      {required this.canLoadMore,
      required final List<PersonalExpenseEntity> items})
      : _items = items;

  @override
  final bool canLoadMore;
  final List<PersonalExpenseEntity> _items;
  @override
  List<PersonalExpenseEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ExpensesState.loaded(canLoadMore: $canLoadMore, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesLoadedImpl &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, canLoadMore, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesLoadedImplCopyWith<_$ExpensesLoadedImpl> get copyWith =>
      __$$ExpensesLoadedImplCopyWithImpl<_$ExpensesLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loading,
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loaded,
    required TResult Function(bool canLoadMore,
            List<PersonalExpenseEntity> items, String errorMessage)
        failure,
  }) {
    return loaded(canLoadMore, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
  }) {
    return loaded?.call(canLoadMore, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(canLoadMore, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpensesLoading value) loading,
    required TResult Function(_ExpensesLoaded value) loaded,
    required TResult Function(_ExpensesFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExpensesLoading value)? loading,
    TResult? Function(_ExpensesLoaded value)? loaded,
    TResult? Function(_ExpensesFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpensesLoading value)? loading,
    TResult Function(_ExpensesLoaded value)? loaded,
    TResult Function(_ExpensesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _ExpensesLoaded implements ExpensesState {
  const factory _ExpensesLoaded(
      {required final bool canLoadMore,
      required final List<PersonalExpenseEntity> items}) = _$ExpensesLoadedImpl;

  @override
  bool get canLoadMore;
  @override
  List<PersonalExpenseEntity> get items;
  @override
  @JsonKey(ignore: true)
  _$$ExpensesLoadedImplCopyWith<_$ExpensesLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ExpensesFailureImplCopyWith<$Res>
    implements $ExpensesStateCopyWith<$Res> {
  factory _$$ExpensesFailureImplCopyWith(_$ExpensesFailureImpl value,
          $Res Function(_$ExpensesFailureImpl) then) =
      __$$ExpensesFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool canLoadMore,
      List<PersonalExpenseEntity> items,
      String errorMessage});
}

/// @nodoc
class __$$ExpensesFailureImplCopyWithImpl<$Res>
    extends _$ExpensesStateCopyWithImpl<$Res, _$ExpensesFailureImpl>
    implements _$$ExpensesFailureImplCopyWith<$Res> {
  __$$ExpensesFailureImplCopyWithImpl(
      _$ExpensesFailureImpl _value, $Res Function(_$ExpensesFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoadMore = null,
    Object? items = null,
    Object? errorMessage = null,
  }) {
    return _then(_$ExpensesFailureImpl(
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PersonalExpenseEntity>,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExpensesFailureImpl implements _ExpensesFailure {
  const _$ExpensesFailureImpl(
      {required this.canLoadMore,
      required final List<PersonalExpenseEntity> items,
      required this.errorMessage})
      : _items = items;

  @override
  final bool canLoadMore;
  final List<PersonalExpenseEntity> _items;
  @override
  List<PersonalExpenseEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String errorMessage;

  @override
  String toString() {
    return 'ExpensesState.failure(canLoadMore: $canLoadMore, items: $items, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpensesFailureImpl &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, canLoadMore,
      const DeepCollectionEquality().hash(_items), errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpensesFailureImplCopyWith<_$ExpensesFailureImpl> get copyWith =>
      __$$ExpensesFailureImplCopyWithImpl<_$ExpensesFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loading,
    required TResult Function(
            bool canLoadMore, List<PersonalExpenseEntity> items)
        loaded,
    required TResult Function(bool canLoadMore,
            List<PersonalExpenseEntity> items, String errorMessage)
        failure,
  }) {
    return failure(canLoadMore, items, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult? Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
  }) {
    return failure?.call(canLoadMore, items, errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loading,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items)?
        loaded,
    TResult Function(bool canLoadMore, List<PersonalExpenseEntity> items,
            String errorMessage)?
        failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(canLoadMore, items, errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ExpensesLoading value) loading,
    required TResult Function(_ExpensesLoaded value) loaded,
    required TResult Function(_ExpensesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ExpensesLoading value)? loading,
    TResult? Function(_ExpensesLoaded value)? loaded,
    TResult? Function(_ExpensesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ExpensesLoading value)? loading,
    TResult Function(_ExpensesLoaded value)? loaded,
    TResult Function(_ExpensesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _ExpensesFailure implements ExpensesState {
  const factory _ExpensesFailure(
      {required final bool canLoadMore,
      required final List<PersonalExpenseEntity> items,
      required final String errorMessage}) = _$ExpensesFailureImpl;

  @override
  bool get canLoadMore;
  @override
  List<PersonalExpenseEntity> get items;
  String get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ExpensesFailureImplCopyWith<_$ExpensesFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
