// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PredictionBloc {
  XFile? get image;
  set image(XFile? value);
  PredictingImageUsecase get predictingImageUsecase;
  set predictingImageUsecase(PredictingImageUsecase value);

  /// Create a copy of PredictionBloc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionBlocCopyWith<PredictionBloc> get copyWith =>
      _$PredictionBlocCopyWithImpl<PredictionBloc>(
          this as PredictionBloc, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionBloc &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.predictingImageUsecase, predictingImageUsecase) ||
                other.predictingImageUsecase == predictingImageUsecase));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, predictingImageUsecase);

  @override
  String toString() {
    return 'PredictionBloc(image: $image, predictingImageUsecase: $predictingImageUsecase)';
  }
}

/// @nodoc
abstract mixin class $PredictionBlocCopyWith<$Res> {
  factory $PredictionBlocCopyWith(
          PredictionBloc value, $Res Function(PredictionBloc) _then) =
      _$PredictionBlocCopyWithImpl;
  @useResult
  $Res call({XFile? image, PredictingImageUsecase predictingImageUsecase});
}

/// @nodoc
class _$PredictionBlocCopyWithImpl<$Res>
    implements $PredictionBlocCopyWith<$Res> {
  _$PredictionBlocCopyWithImpl(this._self, this._then);

  final PredictionBloc _self;
  final $Res Function(PredictionBloc) _then;

  /// Create a copy of PredictionBloc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? predictingImageUsecase = null,
  }) {
    return _then(PredictionBloc(
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      predictingImageUsecase: null == predictingImageUsecase
          ? _self.predictingImageUsecase
          : predictingImageUsecase // ignore: cast_nullable_to_non_nullable
              as PredictingImageUsecase,
    ));
  }
}

/// @nodoc
mixin _$PredictionEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PredictionEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PredictionEvent()';
  }
}

/// @nodoc
class $PredictionEventCopyWith<$Res> {
  $PredictionEventCopyWith(
      PredictionEvent _, $Res Function(PredictionEvent) __);
}

/// @nodoc

class _Initialized implements PredictionEvent {
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
    return 'PredictionEvent.initialized()';
  }
}

/// @nodoc

class _PredictionMade implements PredictionEvent {
  const _PredictionMade();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PredictionMade);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PredictionEvent.predictionMade()';
  }
}

/// @nodoc

class _PredictionDone implements PredictionEvent {
  const _PredictionDone();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _PredictionDone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PredictionEvent.predictionDone()';
  }
}

/// @nodoc
mixin _$PredictionState {
  bool get predictionInProgress;
  bool get predictionSuccess;
  bool get predictionDone;
  XFile? get image;
  XFile? get predictionImage;
  List<dynamic>? get points;
  String? get prediction;
  String? get predictionError;

  /// Create a copy of PredictionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionStateCopyWith<PredictionState> get copyWith =>
      _$PredictionStateCopyWithImpl<PredictionState>(
          this as PredictionState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionState &&
            (identical(other.predictionInProgress, predictionInProgress) ||
                other.predictionInProgress == predictionInProgress) &&
            (identical(other.predictionSuccess, predictionSuccess) ||
                other.predictionSuccess == predictionSuccess) &&
            (identical(other.predictionDone, predictionDone) ||
                other.predictionDone == predictionDone) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.predictionImage, predictionImage) ||
                other.predictionImage == predictionImage) &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.predictionError, predictionError) ||
                other.predictionError == predictionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      predictionInProgress,
      predictionSuccess,
      predictionDone,
      image,
      predictionImage,
      const DeepCollectionEquality().hash(points),
      prediction,
      predictionError);

  @override
  String toString() {
    return 'PredictionState(predictionInProgress: $predictionInProgress, predictionSuccess: $predictionSuccess, predictionDone: $predictionDone, image: $image, predictionImage: $predictionImage, points: $points, prediction: $prediction, predictionError: $predictionError)';
  }
}

/// @nodoc
abstract mixin class $PredictionStateCopyWith<$Res> {
  factory $PredictionStateCopyWith(
          PredictionState value, $Res Function(PredictionState) _then) =
      _$PredictionStateCopyWithImpl;
  @useResult
  $Res call(
      {bool predictionInProgress,
      bool predictionSuccess,
      bool predictionDone,
      XFile? image,
      XFile? predictionImage,
      List<dynamic>? points,
      String? prediction,
      String? predictionError});
}

/// @nodoc
class _$PredictionStateCopyWithImpl<$Res>
    implements $PredictionStateCopyWith<$Res> {
  _$PredictionStateCopyWithImpl(this._self, this._then);

  final PredictionState _self;
  final $Res Function(PredictionState) _then;

  /// Create a copy of PredictionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictionInProgress = null,
    Object? predictionSuccess = null,
    Object? predictionDone = null,
    Object? image = freezed,
    Object? predictionImage = freezed,
    Object? points = freezed,
    Object? prediction = freezed,
    Object? predictionError = freezed,
  }) {
    return _then(_self.copyWith(
      predictionInProgress: null == predictionInProgress
          ? _self.predictionInProgress
          : predictionInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionSuccess: null == predictionSuccess
          ? _self.predictionSuccess
          : predictionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionDone: null == predictionDone
          ? _self.predictionDone
          : predictionDone // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      predictionImage: freezed == predictionImage
          ? _self.predictionImage
          : predictionImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      points: freezed == points
          ? _self.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      prediction: freezed == prediction
          ? _self.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionError: freezed == predictionError
          ? _self.predictionError
          : predictionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _PredictionState implements PredictionState {
  const _PredictionState(
      {this.predictionInProgress = false,
      this.predictionSuccess = false,
      this.predictionDone = false,
      this.image,
      this.predictionImage,
      final List<dynamic>? points,
      this.prediction,
      this.predictionError})
      : _points = points;

  @override
  @JsonKey()
  final bool predictionInProgress;
  @override
  @JsonKey()
  final bool predictionSuccess;
  @override
  @JsonKey()
  final bool predictionDone;
  @override
  final XFile? image;
  @override
  final XFile? predictionImage;
  final List<dynamic>? _points;
  @override
  List<dynamic>? get points {
    final value = _points;
    if (value == null) return null;
    if (_points is EqualUnmodifiableListView) return _points;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? prediction;
  @override
  final String? predictionError;

  /// Create a copy of PredictionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionStateCopyWith<_PredictionState> get copyWith =>
      __$PredictionStateCopyWithImpl<_PredictionState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionState &&
            (identical(other.predictionInProgress, predictionInProgress) ||
                other.predictionInProgress == predictionInProgress) &&
            (identical(other.predictionSuccess, predictionSuccess) ||
                other.predictionSuccess == predictionSuccess) &&
            (identical(other.predictionDone, predictionDone) ||
                other.predictionDone == predictionDone) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.predictionImage, predictionImage) ||
                other.predictionImage == predictionImage) &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction) &&
            (identical(other.predictionError, predictionError) ||
                other.predictionError == predictionError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      predictionInProgress,
      predictionSuccess,
      predictionDone,
      image,
      predictionImage,
      const DeepCollectionEquality().hash(_points),
      prediction,
      predictionError);

  @override
  String toString() {
    return 'PredictionState(predictionInProgress: $predictionInProgress, predictionSuccess: $predictionSuccess, predictionDone: $predictionDone, image: $image, predictionImage: $predictionImage, points: $points, prediction: $prediction, predictionError: $predictionError)';
  }
}

/// @nodoc
abstract mixin class _$PredictionStateCopyWith<$Res>
    implements $PredictionStateCopyWith<$Res> {
  factory _$PredictionStateCopyWith(
          _PredictionState value, $Res Function(_PredictionState) _then) =
      __$PredictionStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool predictionInProgress,
      bool predictionSuccess,
      bool predictionDone,
      XFile? image,
      XFile? predictionImage,
      List<dynamic>? points,
      String? prediction,
      String? predictionError});
}

/// @nodoc
class __$PredictionStateCopyWithImpl<$Res>
    implements _$PredictionStateCopyWith<$Res> {
  __$PredictionStateCopyWithImpl(this._self, this._then);

  final _PredictionState _self;
  final $Res Function(_PredictionState) _then;

  /// Create a copy of PredictionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? predictionInProgress = null,
    Object? predictionSuccess = null,
    Object? predictionDone = null,
    Object? image = freezed,
    Object? predictionImage = freezed,
    Object? points = freezed,
    Object? prediction = freezed,
    Object? predictionError = freezed,
  }) {
    return _then(_PredictionState(
      predictionInProgress: null == predictionInProgress
          ? _self.predictionInProgress
          : predictionInProgress // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionSuccess: null == predictionSuccess
          ? _self.predictionSuccess
          : predictionSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      predictionDone: null == predictionDone
          ? _self.predictionDone
          : predictionDone // ignore: cast_nullable_to_non_nullable
              as bool,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      predictionImage: freezed == predictionImage
          ? _self.predictionImage
          : predictionImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      points: freezed == points
          ? _self._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      prediction: freezed == prediction
          ? _self.prediction
          : prediction // ignore: cast_nullable_to_non_nullable
              as String?,
      predictionError: freezed == predictionError
          ? _self.predictionError
          : predictionError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
