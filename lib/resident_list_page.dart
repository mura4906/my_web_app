import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/extensions.dart';
import 'package:my_web_app/models.dart';
import 'package:my_web_app/providers.dart';

class ResidentListPage extends HookConsumerWidget {
  const ResidentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final residentList = ref.watch(residentListProvider);

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
              ...data.map((item) => Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(item.name),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              color: item.location.color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(item.location.title),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (item.location == Location.home)
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: item.canPingPong
                                    ? Colors.blue[100]
                                    : Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                item.canPingPong ? '🔔OK' : '🔔NG',
                                style: TextStyle(
                                    color: item.canPingPong
                                        ? Colors.black
                                        : Colors.grey),
                              ),
                            ),
                        ],
                      ),
                      subtitle: item.memo.data.isNotEmpty
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[100],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        item.memo.data,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    if (item.memo.time != null)
                                      SizedBox(
                                        width: double.infinity,
                                        child: Text(
                                          item.memo.time!.myText,
                                          textAlign: TextAlign.end,
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            )
                          : null,
                    ),
                  )),
            ],
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
