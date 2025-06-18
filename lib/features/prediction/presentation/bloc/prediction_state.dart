part of 'prediction_bloc.dart';

@freezed
abstract class PredictionState with _$PredictionState {
  const factory PredictionState({
    @Default(false) bool predictionInProgress,
    @Default(false) bool predictionSuccess,
    @Default(false) bool predictionDone,
    XFile? image,
    XFile? predictionImage,
    List<dynamic>? points,
    String? prediction,
    String? predictionError,
  }) = _PredictionState;
}
