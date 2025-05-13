part of 'tarot_bloc.dart';

@freezed
class TarotEvent with _$TarotEvent {
  const factory TarotEvent.Initialized() = _Initialized;
  const factory TarotEvent.TarotChanged(int index) = _TarotChanged;
}