import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stargazer/features/prediction/domain/usecases/predicting_image_usecase.dart';
// import 'package:stargazer/features/prediction/domain/usecases/predicting_usecase.dart';
// import 'package:stargazer/features/prediction/domain/usecases/prediction_to_img_usecase.dart';
import 'package:path_provider/path_provider.dart';

part 'prediction_event.dart';
part 'prediction_state.dart';
part 'prediction_bloc.freezed.dart';

@freezed
class PredictionBloc extends Bloc<PredictionEvent, PredictionState>
    with _$PredictionBloc {
  XFile? image;
  PredictingImageUsecase predictingImageUsecase;
  // PredictingUsecase predictingUsecase;
  // PredictionToImgUsecase predictionToImgUsecase;

  PredictionBloc({
    this.image,
    required this.predictingImageUsecase,
    // required this.predictingUsecase,
    // required this.predictionToImgUsecase,
  }) : super(const PredictionState()) {
    on<_Initialized>((event, emit) {
      emit(state.copyWith(predictionInProgress: true, image: image));
      add(PredictionEvent.predictionMade());
    });

    on<_PredictionMade>((event, emit) async {
      emit(state.copyWith(predictionInProgress: true));
      try {
        final result = await predictingImageUsecase(image!);

        // Convert base64 image to XFile
        final bytes = base64Decode(result.annotatedImage);
        final predict_list = result.palmPredictions;
        String predict_telling = '';
        for (int i = 0; i < predict_list.length; i++) {
          predict_telling += predict_list[i].interpretation;
        }
        final tempDir = await getTemporaryDirectory();
        final tempFile = File(
            '${tempDir.path}/processed_${DateTime.now().millisecondsSinceEpoch}.jpg');
        await tempFile.writeAsBytes(bytes);

        final processedImage = XFile(tempFile.path);
        print('da co anh du doan');
        // Convert points to List<double> for compatibility
        final points = result.predictions;
        print(points);
        emit(
          state.copyWith(
              predictionInProgress: false,
              predictionSuccess: true,
              predictionImage: processedImage,
              points: points,
              prediction: predict_telling),
        );
      } catch (e) {
        emit(state.copyWith(
          predictionInProgress: false,
          predictionError: e.toString(),
        ));
      }
    });

    on<_PredictionDone>((event, emit) async {
      print('PredictionDone event received');
      try {
        print('du doan da xong');
        emit(state.copyWith(predictionDone: true));
      } catch (e) {
        print('Error in prediction: $e');
        emit(state.copyWith(
          predictionError: e.toString(),
        ));
      }
    });

    add(_Initialized());
  }
}
