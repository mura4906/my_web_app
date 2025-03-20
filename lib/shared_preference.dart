import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  try {
    // 全ての SharedPreferences のキーに接頭辞を設定
    SharedPreferences.setPrefix('good');
  } catch (error, _) {
    debugPrint(error.toString());
  }

  return SharedPreferences.getInstance();
}
