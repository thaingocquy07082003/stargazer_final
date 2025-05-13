part of 'tarot_bloc.dart';

@freezed
abstract class TarotState with _$TarotState {
  const factory TarotState({
    @Default(0) int chosenTarot,
    @Default([]) List<Tarot> tarotList,
  }) = _TarotState;
}
