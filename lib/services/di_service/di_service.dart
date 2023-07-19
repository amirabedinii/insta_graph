import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:insta_graph/services/di_service/di_service.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

class DIService {
  DIService._privateConstructor();

  static final DIService _instance = DIService._privateConstructor();

  factory DIService() => _instance;

  GetIt get di => GetIt.instance;

  T getModel<T extends Object>() {
    return di.get<T>();
  }
}
