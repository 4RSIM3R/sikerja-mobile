import 'package:flavor/flavor.dart';

import 'bootstrap.dart';
import 'common/utils/config.dart';

void main() {
  Flavor.create(
    Environment.production,
    properties: {
      Keys.apiUrl: 'https://api.dk-sumedang.com/',
      Configs.customKey: 'value',
    },
  );
  bootstrap();
}
