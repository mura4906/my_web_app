import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/my_dropdown.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SafeArea(
      child: Scaffold(body: MyDropdown()),
    );
  }
}
