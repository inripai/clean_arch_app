import 'package:clean_arch_app/domain/entities/danfe_entity.dart';

abstract class DanfeRepository {
  Future<Danfe> fetchDanfeData(String chave);
}
