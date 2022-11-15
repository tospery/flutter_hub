import 'package:hi_flutter/hi_flutter.dart';
import '../model/configuration.dart';

extension HiConfigurationEx on HiConfiguration {
  Configuration get real => this as Configuration;
}
