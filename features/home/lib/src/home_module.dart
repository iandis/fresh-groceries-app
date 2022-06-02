import 'package:get_it/get_it.dart';
import 'package:home/src/home_module.config.dart';
import 'package:injectable/injectable.dart';

@injectableInit
void initHomeFeature(GetIt getIt) => $initGetIt(getIt);
