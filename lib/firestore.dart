import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_web_app/models.dart';

void fireBaseTestCall() async {
  //await FirestoreService.instance.addKey('テストキー');
  //await FirestoreService.instance.addResident('tester');
}

/// ファイアーストアと通信するクラス
class FirestoreService {
  FirestoreService._();
  static FirestoreService instance = FirestoreService._();
  final db = FirebaseFirestore.instance;

  Future<void> addResident(String name) async {
    await db
        .collection('residents')
        .add(Resident.register(name: name).toJson());
  }

  Future<void> addKey(String name) async {
    await db
        .collection('houseKeys')
        .add(HouseKey.register(name: name).toJson());
  }

  Future<void> addResidentAll() async {
    addResident('ゆう');
    addResident('りさこ');
    addResident('ひより');
    addResident('あかね');
    addResident('このか');
    addResident('あみ');
    addResident('のぞみ');
    addResident('あおい');
    addResident('なお');
  }

  Future<List<HouseKey>> readKeyList() async {
    final doc = await db.collection('houseKeys').orderBy('name').get();
    final keyList = doc.docs.map((e) {
      return HouseKey.fromJson(e.id, e.data());
    }).toList();
    if (kDebugMode) {
      return keyList;
    } else {
      return keyList.where((e) => e.name != 'テスト').toList();
    }
  }

  /* Read 読み出し */
  Future<List<Resident>> readResidentList() async {
    final doc = await db.collection('residents').orderBy('location').get();
    final residentList = doc.docs.map((e) {
      final i = Resident.fromJson(e.id, e.data());
      return i;
    }).toList();
    if (kDebugMode) {
      return residentList;
    } else {
      return residentList.where((e) => e.name != 'tester').toList();
    }
  }

  Future<void> deleteResident(String residentId) async {
    await db.collection('residents').doc(residentId).delete();
  }

  Future<void> updateResident(Resident resident) async {
    await db.collection('residents').doc(resident.id).update(resident.toJson());
  }

  Future<void> updateKey(HouseKey houseKey) async {
    await db.collection('houseKeys').doc(houseKey.id).update(houseKey.toJson());
  }
}
