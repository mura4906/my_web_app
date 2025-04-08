import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/extensions.dart';
import 'package:my_web_app/my_choice_chip.dart';
import 'package:my_web_app/firestore.dart';
import 'package:my_web_app/models.dart';
import 'package:collection/collection.dart';
import 'package:my_web_app/providers.dart';

class OwnerPage extends HookConsumerWidget {
  const OwnerPage({super.key});

  Widget editWidget(Resident user, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                user.name,
                style: TextStyle(fontSize: 18),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyChoiceChip(user.location, (location) {
                    final newMemo = user.memo.copyWith(time: DateTime.now());
                    final newUser =
                        user.copyWith(location: location, memo: newMemo);
                    ref
                        .read(residentListProvider.notifier)
                        .updateResident(newUser);
                    FirestoreService.instance.updateResident(newUser);
                  }),
                  if (user.location == Location.home && !user.isGuest)
                    Row(
                      children: [
                        const Text(
                          'ピンポン可',
                          style: TextStyle(fontSize: 12),
                        ),
                        Transform.scale(
                          scale: 0.85,
                          child: CupertinoSwitch(
                            value: user.canPingPong,
                            activeColor: Colors.blue[200],
                            onChanged: (e) {
                              final newUser = user.copyWith(canPingPong: e);
                              ref
                                  .read(residentListProvider.notifier)
                                  .updateResident(newUser);
                              FirestoreService.instance.updateResident(newUser);
                            },
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MyTextField(
                value: user.memo.data,
                onSaved: (value) {
                  final newUser = user.copyWith(
                      memo: Memo(data: value, time: DateTime.now()));
                  ref
                      .read(residentListProvider.notifier)
                      .updateResident(newUser);
                  FirestoreService.instance.updateResident(newUser);
                }),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              user.memo.time?.myText ?? '',
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentList = ref.watch(residentListProvider);
    final user = residentList.value
        ?.firstWhereOrNull((e) => e.id == ref.read(userProvider).value?.id);
    final guest = residentList.value?.firstWhereOrNull((e) => e.isGuest);

    return residentList.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(residentListProvider);
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            children: [
              if (user != null) editWidget(user, ref),
              const SizedBox(
                height: 20,
              ),
              if (guest != null) editWidget(guest, ref),
            ],
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class MyTextField extends HookConsumerWidget {
  final String value;
  final ValueChanged<String> onSaved;

  const MyTextField({super.key, required this.value, required this.onSaved});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = useTextEditingController(text: value);
    final snackBar = SnackBar(
      content: const Text(
        "メモを保存しました",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.blue[50],
      duration: const Duration(seconds: 2),
    );
    // final snackBar = SnackBar(
    //   content: const Text("Normal SnackBar!!"),
    //   action: SnackBarAction(
    //     label: "close",
    //     onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
    //   ),
    //   duration: const Duration(seconds: 10),
    // );

//    return Expanded(
    return Row(
      children: [
        Flexible(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: controller,
            decoration: InputDecoration(
              labelText: 'メモ',
              fillColor: const Color.fromRGBO(240, 240, 240, 1),
              filled: true,
              border: InputBorder.none,
              suffixIcon: IconButton(
                  onPressed: () async {
                    controller.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    size: 16,
                  )),
              //suffixIcon: Icon(Icons.guest),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            onSaved(controller.text);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: const Text(
              '保存',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

// class MemoApp extends StatefulWidget {
//   const MemoApp({super.key});

//   @override
//   _MemoAppState createState() => _MemoAppState();
// }

// class _MemoAppState extends State<MemoApp> {
//   final List<String> _memos = ['メモ1', 'メモ2', 'メモ3'];

//   void _showEditDialog(int index) {
//     TextEditingController controller =
//         TextEditingController(text: _memos[index]);

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('メモ編集'),
//           content: TextField(
//             controller: controller,
//             maxLines: null,
//             decoration: const InputDecoration(hintText: 'メモを入力'),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // キャンセル
//               },
//               child: const Text('キャンセル'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   _memos[index] = controller.text;
//                 });
//                 Navigator.pop(context); // 保存
//               },
//               child: const Text('保存'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _memos.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(_memos[index]),
//           trailing: IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () => _showEditDialog(index),
//           ),
//         );
//       },
//     );
//   }
// }
