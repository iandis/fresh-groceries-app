import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:product/src/product_module.config.dart';

@injectableInit
void initProductFeature(GetIt getIt) {
  $initGetIt(
    getIt,
    environmentFilter: SimpleEnvironmentFilter(
      filter: (Set<String> envs) => envs.isEmpty || envs.contains('mock'),
      environments: <String>{'mock'},
    ),
  );
}
