import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../common/Contants/common.dart';

Future<void> initHive()async {
  await Hive.initFlutter();
  var authenticationBox = await Hive.openBox(AUTHENTICATION_BOX);
  authenticationBox.clear();
}