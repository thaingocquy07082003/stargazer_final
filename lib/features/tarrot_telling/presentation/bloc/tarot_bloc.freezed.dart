// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tarot_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TarotEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TarotEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TarotEvent()';
  }
}

/// @nodoc
class $TarotEventCopyWith<$Res> {
  $TarotEventCopyWith(TarotEvent _, $Res Function(TarotEvent) __);
}

/// @nodoc

class _Initialized implements TarotEvent {
  const _Initialized();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TarotEvent.Initialized()';
  }
}

/// @nodoc

class _TarotChanged implements TarotEvent {
  const _TarotChanged(this.index);

  final int index;

  /// Create a copy of TarotEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarotChangedCopyWith<_TarotChanged> get copyWith =>
      __$TarotChangedCopyWithImpl<_TarotChanged>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarotChanged &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @override
  String toString() {
    return 'TarotEvent.TarotChanged(index: $index)';
  }
}

/// @nodoc
abstract mixin class _$TarotChangedCopyWith<$Res>
    implements $TarotEventCopyWith<$Res> {
  factory _$TarotChangedCopyWith(
          _TarotChanged value, $Res Function(_TarotChanged) _then) =
      __$TarotChangedCopyWithImpl;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$TarotChangedCopyWithImpl<$Res>
    implements _$TarotChangedCopyWith<$Res> {
  __$TarotChangedCopyWithImpl(this._self, this._then);

  final _TarotChanged _self;
  final $Res Function(_TarotChanged) _then;

  /// Create a copy of TarotEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? index = null,
  }) {
    return _then(_TarotChanged(
      null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$TarotState {
  int get chosenTarot;
  List<Tarot> get tarotList;

  /// Create a copy of TarotState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TarotStateCopyWith<TarotState> get copyWith =>
      _$TarotStateCopyWithImpl<TarotState>(this as TarotState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TarotState &&
            (identical(other.chosenTarot, chosenTarot) ||
                other.chosenTarot == chosenTarot) &&
            const DeepCollectionEquality().equals(other.tarotList, tarotList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, chosenTarot, const DeepCollectionEquality().hash(tarotList));

  @override
  String toString() {
    return 'TarotState(chosenTarot: $chosenTarot, tarotList: $tarotList)';
  }
}

/// @nodoc
abstract mixin class $TarotStateCopyWith<$Res> {
  factory $TarotStateCopyWith(
          TarotState value, $Res Function(TarotState) _then) =
      _$TarotStateCopyWithImpl;
  @useResult
  $Res call({int chosenTarot, List<Tarot> tarotList});
}

/// @nodoc
class _$TarotStateCopyWithImpl<$Res> implements $TarotStateCopyWith<$Res> {
  _$TarotStateCopyWithImpl(this._self, this._then);

  final TarotState _self;
  final $Res Function(TarotState) _then;

  /// Create a copy of TarotState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chosenTarot = null,
    Object? tarotList = null,
  }) {
    return _then(_self.copyWith(
      chosenTarot: null == chosenTarot
          ? _self.chosenTarot
          : chosenTarot // ignore: cast_nullable_to_non_nullable
              as int,
      tarotList: null == tarotList
          ? _self.tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<Tarot>,
    ));
  }
}

/// @nodoc

class _TarotState implements TarotState {
  const _TarotState(
      {this.chosenTarot = 0, final List<Tarot> tarotList = const []})
      : _tarotList = tarotList;

  @override
  @JsonKey()
  final int chosenTarot;
  final List<Tarot> _tarotList;
  @override
  @JsonKey()
  List<Tarot> get tarotList {
    if (_tarotList is EqualUnmodifiableListView) return _tarotList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tarotList);
  }

  /// Create a copy of TarotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TarotStateCopyWith<_TarotState> get copyWith =>
      __$TarotStateCopyWithImpl<_TarotState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TarotState &&
            (identical(other.chosenTarot, chosenTarot) ||
                other.chosenTarot == chosenTarot) &&
            const DeepCollectionEquality()
                .equals(other._tarotList, _tarotList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, chosenTarot,
      const DeepCollectionEquality().hash(_tarotList));

  @override
  String toString() {
    return 'TarotState(chosenTarot: $chosenTarot, tarotList: $tarotList)';
  }
}

/// @nodoc
abstract mixin class _$TarotStateCopyWith<$Res>
    implements $TarotStateCopyWith<$Res> {
  factory _$TarotStateCopyWith(
          _TarotState value, $Res Function(_TarotState) _then) =
      __$TarotStateCopyWithImpl;
  @override
  @useResult
  $Res call({int chosenTarot, List<Tarot> tarotList});
}

/// @nodoc
class __$TarotStateCopyWithImpl<$Res> implements _$TarotStateCopyWith<$Res> {
  __$TarotStateCopyWithImpl(this._self, this._then);

  final _TarotState _self;
  final $Res Function(_TarotState) _then;

  /// Create a copy of TarotState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chosenTarot = null,
    Object? tarotList = null,
  }) {
    return _then(_TarotState(
      chosenTarot: null == chosenTarot
          ? _self.chosenTarot
          : chosenTarot // ignore: cast_nullable_to_non_nullable
              as int,
      tarotList: null == tarotList
          ? _self._tarotList
          : tarotList // ignore: cast_nullable_to_non_nullable
              as List<Tarot>,
    ));
  }
}

// dart format on
