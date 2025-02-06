import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/my_dropdown.dart';
import 'package:my_web_app/key_page.dart';
import 'package:my_web_app/owner_page.dart';
import 'package:my_web_app/providers.dart';
import 'package:my_web_app/resident_list_page.dart';
import 'package:my_web_app/setting_page.dart';

class BasePage extends HookConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final curUser = ref.watch(userProvider).value;
    final selectedTab = useState(TabType.key);

    if (curUser == null) {
      return const Scaffold(body: MyDropdown());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTab.value.title),
        centerTitle: false,
        actions: [
          CircleAvatar(
              radius: 20,
              child:
                  Text(curUser.name.substring(0, min(2, curUser.name.length)))),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: switch (selectedTab.value) {
        TabType.key => const KeyPage(),
        TabType.self => const OwnerPage(),
        TabType.residentList => const ResidentListPage(),
        TabType.setting => const SettingPage(),
      },
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: selectedTab.value.raw,
        onTap: (index) {
          selectedTab.value = TabType.values.firstWhere((e) => e.raw == index);
        },
        border: const Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.key),
            tooltip: "鍵",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            tooltip: "編集",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            tooltip: "住人一覧",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            tooltip: "設定",
          ),
        ],
        activeColor: Colors.lightBlue,
        iconSize: 30,
      ),
    );
  }
}

enum TabType {
  key(0),
  self(1),
  residentList(2),
  setting(3);

  final int raw;
  String get title {
    switch (this) {
      case TabType.key:
        return '鍵';
      case TabType.self:
        return 'オーナー';
      case TabType.residentList:
        return '住人';
      case TabType.setting:
        return '設定';
    }
  }

  const TabType(this.raw);
}
