import 'package:flutter_hub/model/user.dart';
import 'package:hi_flutter/hi_flutter.dart';

extension HiUserEx on HiUser {
  User get real => this as User;
}
