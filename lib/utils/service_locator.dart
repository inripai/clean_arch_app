import 'package:get_it/get_it.dart';
import '../data/api/dao/chave_nfe.dart';
import '../data/api/dao/login_dao.dart';
import '../data/repositories/danfe_repository.dart';
import '../data/repositories/login_repository.dart';
import '../domain/repositories/danfe_repository.dart';
import '../domain/repositories/login_repository.dart';
import '../domain/usecases/get_dnfe_data.dart';
import '../domain/usecases/login_user.dart';

final sl = GetIt.instance;

void init() {
  // DAOs
  sl.registerLazySingleton(() => Danfe_Dao());
  sl.registerLazySingleton(() => Login_Dao());

  // Repositories
  sl.registerLazySingleton<DanfeRepository>(() => DanfeRepositoryImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetDanfeData(sl()));
  sl.registerLazySingleton(() => LoginUser(sl()));
}
