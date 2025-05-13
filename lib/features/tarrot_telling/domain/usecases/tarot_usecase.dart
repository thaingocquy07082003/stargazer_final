import 'package:stargazer/core/services/domain/entities/tarot.dart';
import 'package:stargazer/features/tarrot_telling/data/tarot_repo_impl.dart';

class TarotUsecase {
  static List<Tarot> getTarot() {
    return TarotRepositoryImpl().getTarot();
  }
}
