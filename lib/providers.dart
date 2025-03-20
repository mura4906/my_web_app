import 'package:collection/collection.dart';
import 'package:my_web_app/extensions.dart';
import 'package:my_web_app/firestore.dart';
import 'package:my_web_app/models.dart';
import 'package:my_web_app/shared_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  @override
  Future<Resident?> build() async {
    final pref = await ref.read(sharedPreferencesProvider.future);
    final userId = pref.getString('userID');

    final residentList = await ref.read(residentListProvider.future);
    final user = residentList.getUser(userId);
    return user;
  }

  void set(Resident user) {
    state = AsyncData(user);
  }
}

@Riverpod(keepAlive: true)
class Guest extends _$Guest {
  @override
  Future<Resident?> build() async {
    final residentList = await ref.read(residentListProvider.future);
    return residentList.firstWhereOrNull((e) => e.isGuest);
  }
}

@Riverpod(keepAlive: true)
class ResidentList extends _$ResidentList {
  @override
  Future<List<Resident>> build() async {
    return await FirestoreService.instance.readResidentList();
  }

  updateResident(Resident resident) {
    if (state.value == null) {
      return;
    }
    state = AsyncData(state.value!.map((e) {
      if (resident.id == e.id) {
        return resident;
      } else {
        return e;
      }
    }).toList());
  }

  deleteResident(Resident resident) {
    if (state.value == null) {
      return;
    }
    final newResidents = state.value!;
    newResidents.removeWhere((e) => e.id == resident.id);
    state = AsyncData(newResidents);
  }

  addResident(Resident resident) {
    if (state.value == null) {
      return;
    }
    final newResidents = state.value!;
    newResidents.add(resident);
    state = AsyncData(newResidents);
  }
}

@Riverpod(keepAlive: true)
class KeyList extends _$KeyList {
  @override
  Future<List<HouseKey>> build() async {
    return await FirestoreService.instance.readKeyList();
  }

  updateKey(HouseKey houseKey) {
    if (state.value == null) {
      return;
    }
    state = AsyncData(state.value!.map((e) {
      if (houseKey.id == e.id) {
        return houseKey;
      } else {
        return e;
      }
    }).toList());
  }
}
