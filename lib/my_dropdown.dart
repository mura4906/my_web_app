import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/extensions.dart';
import 'package:my_web_app/models.dart';
import 'package:my_web_app/providers.dart';
import 'package:my_web_app/shared_preference.dart';

class MyDropdown extends HookConsumerWidget {
  const MyDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userProvider).value?.id;

    final residentList = ref.watch(residentListProvider);
    final curUser = residentList.value?.getUser(userId);

    return SafeArea(
      child: Center(
        child: residentList.when(
            data: (List<Resident> data) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'あなたの名前は？',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField2<Resident>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      hint: const Text(
                        'Select Your Name',
                        style: TextStyle(fontSize: 14),
                      ),
                      value: curUser,
                      items: data
                          .map((item) => DropdownMenuItem<Resident>(
                                value: item,
                                child: Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (newValue) async {
                        if (newValue != null) {
                          ref.read(userProvider.notifier).set(newValue);
                          final sharedPreferences =
                              await ref.read(sharedPreferencesProvider.future);
                          sharedPreferences.setString('userID', newValue.id);
                        }
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ],
                ),
              );
            },
            error: (Object error, StackTrace stackTrace) =>
                Text(error.toString()),
            loading: () => const Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
