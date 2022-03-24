export 'models/user.dart';
export 'database/database_handler.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static late SharedPreferences pref;
  static init() async => pref = await SharedPreferences.getInstance();
}
