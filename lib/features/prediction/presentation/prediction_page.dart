import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stargazer/features/prediction/domain/usecases/predicting_image_usecase.dart';
import 'package:stargazer/features/prediction/domain/usecases/predicting_usecase.dart';
import 'package:stargazer/features/prediction/domain/usecases/prediction_to_img_usecase.dart';
import 'package:stargazer/features/prediction/presentation/bloc/prediction_bloc.dart';
import 'package:stargazer/features/prediction/presentation/prediction_container.dart';

class PredictionPage extends StatelessWidget {
  final XFile image;
  const PredictionPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => PredictionBloc(
            image: image,
            predictingImageUsecase: PredictingImageUsecase(),
            predictingUsecase: PredictingUsecase(),
            predictionToImgUsecase: PredictionToImgUsecase(),
          ),

      child: PredictionContainer(),
    );
  }
}
