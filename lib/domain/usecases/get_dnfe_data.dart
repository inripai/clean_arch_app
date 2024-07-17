import '../entities/danfe_entity.dart';
import '../repositories/danfe_repository.dart';

class GetDanfeData {
  final DanfeRepository repository;

  GetDanfeData(this.repository);

  Future<Danfe> execute(String chave) async {
    return await repository.fetchDanfeData(chave);
  }
}
