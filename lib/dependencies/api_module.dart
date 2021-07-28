import 'package:flutter_test_task/data/api/services/api_post_service.dart';
import 'package:flutter_test_task/data/api/utilities/api_util.dart';
import 'package:flutter_test_task/data/api/services/api_user_service.dart';

class ApiModule {
  static ApiUserUtil? _apiUserUtil;
  static ApiPostUtil? _apiPostUtil;

  static ApiUserUtil? apiUserUtil() {
    _apiUserUtil ??= ApiUserUtil(ApiUserGet());
    return _apiUserUtil;
  }

  static ApiPostUtil? apiPostUtil() {
    _apiPostUtil ??= ApiPostUtil(ApiPostGet());
    return _apiPostUtil;
  }
}
