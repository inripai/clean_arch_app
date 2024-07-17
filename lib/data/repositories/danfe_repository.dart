import 'dart:convert';

import 'package:clean_arch_app/data/models/danfe_model.dart';
import '../../domain/entities/danfe_entity.dart';
import '../../domain/repositories/danfe_repository.dart';
import '../api/dao/chave_nfe.dart';

class DanfeRepositoryImpl implements DanfeRepository {
  final Danfe_Dao danfeDao;

  DanfeRepositoryImpl(this.danfeDao);

  @override
  Future<Danfe> fetchDanfeData(String chave) async {
    final response = await danfeDao.Call_Danfe_API(chave);
    if (response.isNotEmpty) {
      return DanfeModel.fromJson(jsonDecode(response));
    }
    throw Exception('Failed to fetch data');
  }
}
