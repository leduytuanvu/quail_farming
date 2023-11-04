import 'package:flutter/material.dart';
import 'package:quail_farming/core/environments/config_manager.dart';

class Constants {
  const Constants._();
  // SharedPreferences keys
  static const String sharedThemeKey = 'theme';
  static const String sharedUserKey = 'user';
  static const String sharedEmailKey = 'email';
  static const String sharedUsernameKey = 'username';
  static const String sharedPhoneKey = 'phone';
  static const String sharedExpiryKey = 'expiry';
  static const String sharedAccessTokenKey = 'access_token';
  static const String sharedRefreshTokenKey = 'refresh_token';
  static const String sharedListTopicDevice = 'list_device_topic';
  // Color
  static const Color primaryColor = Color(0xFF53B175);
  static const Color appBarColor = Color(0xFF53B175);
  static const Color buttonColor = Color(0xFF53B175);
  static const Color linkColor = Color(0xFF53B175);

  // Endpoints
  static String apiLoginUrl = '${ConfigManager.config.apiBaseUrl}/iot/signIn';
}
