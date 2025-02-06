import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/my_choice_chip.dart';
import 'package:my_web_app/extensions.dart';
import 'package:my_web_app/firestore.dart';
import 'package:my_web_app/providers.dart';

class KeyPage extends HookConsumerWidget {
  const KeyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyList = ref.watch(keyListProvider);
    return keyList.when(
      data: (data) {
        return RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(keyListProvider);
          },
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            children: [
              ...data.map((item) {
                final lastResident = item.lastResident;
                return ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [Text(item.name), const Icon(Icons.key)],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (lastResident != null)
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: lastResident.location.color,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  child: Text(
                                    lastResident.name,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  item.time?.myText ?? '',
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          MyChoiceChip(item.location, (location) {
                            final residentList = ref.read(residentListProvider);
                            final userId = ref.read(userProvider).value?.id;
                            final user = residentList.value?.getUser(userId);
                            final newKey = item.copyWith(
                                location: location,
                                time: DateTime.now(),
                                lastResident: user ?? item.lastResident);

                            ref
                                .read(keyListProvider.notifier)
                                .updateKey(newKey);
                            FirestoreService.instance.updateKey(newKey);
                          }),
                        ],
                      ),
                    ],
                  ),
                  // subtitle:
                  //     item.memo.isNotEmpty ? Text(item.memo) : null,
                );
              }),
            ],
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
