import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stargazer/core/services/domain/entities/tarot.dart';
import 'package:stargazer/features/tarrot_telling/domain/usecases/tarot_usecase.dart';

part 'tarot_event.dart';
part 'tarot_state.dart';
part 'tarot_bloc.freezed.dart';

class TarotBloc extends Bloc<TarotEvent, TarotState> {
  TarotBloc() : super(const TarotState()) {
    on<_TarotChanged>((event, emit) {
      emit(state.copyWith(chosenTarot: event.index));
      print('tarot from state : ${state.chosenTarot}');
    });


    on<_Initialized>((event, emit)  {
      final tarotList =  TarotUsecase.getTarot();
      emit(state.copyWith(tarotList: tarotList));
    });
  }
}