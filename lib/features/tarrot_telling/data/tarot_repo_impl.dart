import 'package:stargazer/core/services/domain/entities/tarot.dart';
import 'package:stargazer/features/tarrot_telling/data/tarrot_data.dart';
import 'package:stargazer/features/tarrot_telling/domain/repositories/tarot_repository.dart';

class TarotRepositoryImpl implements TarotRepository {
  @override
  List<Tarot> getTarot() {
    return tarotList;
  }
}
