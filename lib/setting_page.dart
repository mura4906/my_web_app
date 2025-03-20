import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/firestore.dart';
import 'package:my_web_app/my_dropdown.dart';
import 'package:my_web_app/providers.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentList = ref.watch(residentListProvider);
    final textController = useTextEditingController();
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const MyDropdown(),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    '住人一覧',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () async {
                        textController.text = '';
                        await _showEditDialog(context, textController,
                            (String newName) {
                          FirestoreService.instance.addResident(newName);
                          ref.invalidate(residentListProvider);
                        });
                      },
                      child: const Text(
                        '新規追加',
                      )),
                )
              ],
            ),
            Expanded(
              child: residentList.when(
                data: (data) {
                  return RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(residentListProvider);
                      },
                      child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          children: [
                            ...data.map(
                              (item) => ListTile(
                                title: Text(
                                  item.name,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        textController.text = item.name;
                                        await _showEditDialog(
                                            context, textController,
                                            (String newName) {
                                          final newResident =
                                              item.copyWith(name: newName);
                                          ref
                                              .read(
                                                  residentListProvider.notifier)
                                              .updateResident(newResident);
                                          FirestoreService.instance
                                              .updateResident(newResident);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                "削除",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              content:
                                                  Text("${item.name}を削除しますか？"),
                                              actions: [
                                                TextButton(
                                                  child: const Text("Cancel"),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                ),
                                                TextButton(
                                                    child: const Text("OK"),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      FirestoreService.instance
                                                          .deleteResident(
                                                              item.id);

                                                      ref
                                                          .read(
                                                              residentListProvider
                                                                  .notifier)
                                                          .deleteResident(item);
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        CupertinoIcons.delete,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]));
                },
                error: (Object error, StackTrace stackTrace) =>
                    Text(error.toString()),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<void> _showEditDialog(
      BuildContext context,
      TextEditingController textEditingController,
      void Function(String name) action) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            textEditingController.text.isEmpty ? '新規追加' : '名前の編集',
          ),
          content: TextField(
            controller: textEditingController,
            decoration: const InputDecoration(hintText: '名前を入力してください'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (textEditingController.text.isEmpty) {
                  return;
                }
                action(textEditingController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
