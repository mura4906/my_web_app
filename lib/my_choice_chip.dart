import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_web_app/models.dart';

class MyChoiceChip extends HookConsumerWidget {
  final Location selection;
  final ValueChanged<Location> onChanged;

  const MyChoiceChip(this.selection, this.onChanged, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectionNotifier = useState(selection);
    useEffect(() {
      selectionNotifier.value = selection;
      return null;
    }, [selection]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 10.0),
        Wrap(
          spacing: 5.0,
          children: Location.values.map((e) {
            return ChoiceChip.elevated(
              showCheckmark: false,
              label: Text(e.title),
              selected: e == selectionNotifier.value,
              onSelected: (bool selected) {
                if (selected) {
                  selectionNotifier.value = e;
                  onChanged(e);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
