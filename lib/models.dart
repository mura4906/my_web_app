import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';



@freezed
class Resident with _$Resident {
  factory Resident({
    required String id,
    required String name,
    required Location location,
    required bool canPingPong,
    required Memo memo,
  }) = _Resident;

  bool get isGuest => name.contains('ゲスト');

  const Resident._();

  factory Resident.register({required String name}) => Resident(
      id: '',
      name: name,
      location: Location.home,
      canPingPong: false,
      memo: Memo(data: '', time: null));

  factory Resident.fromJson(String id, Map<String, dynamic> json) {
    return Resident(
      id: id,
      name: json['name'] as String,
      canPingPong:
          (json['pingPong'] == null) ? false : json['pingPong'] as bool,
      location: Location.values.firstWhere(
        (e) => e.raw == (json['location'] as int),
      ),
      memo: Memo.fromJson(json['memo']),
    );
  }

  factory Resident.fromJsonWithID(Map<String, dynamic> json) {
    return Resident(
      id: json['id'] as String,
      canPingPong:
          (json['pingPong'] == null) ? false : json['pingPong'] as bool,
      name: json['name'] as String,
      location: Location.values.firstWhere(
        (e) => e.raw == (json['location'] as int),
      ),
      memo: Memo.fromJson(json['memo']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location.raw,
      'pingPong': canPingPong,
      'memo': memo.toJson(),
    };
  }

  Map<String, dynamic> toJsonWithID() {
    return {
      'id': id,
      'name': name,
      'pingPong': canPingPong,
      'location': location.raw,
      'memo': memo.toJson(),
    };
  }
}


@freezed
class Memo with _$Memo {
  factory Memo({
    required String data,
    required DateTime? time,
  }) = _Memo;

  const Memo._();

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      data: json['data'] as String,
      time: (json['time'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'time': time == null ? null : Timestamp.fromDate(time!),
    };
  }
}

@freezed
class HouseKey with _$HouseKey {
  factory HouseKey({
    required String id,
    required String name,
    required Location location,
    required Resident? lastResident,
    required DateTime? time,
  }) = _HouseKey;

  const HouseKey._();

  factory HouseKey.register({required String name}) => HouseKey(
      id: '',
      name: name,
      location: Location.home,
      lastResident: null,
      time: null);

  factory HouseKey.fromJson(String id, Map<String, dynamic> json) {
    return HouseKey(
      id: id,
      name: json['name'] as String,
      time: (json['time'] as Timestamp?)?.toDate(),
      location: Location.values.firstWhere(
        (e) => e.raw == (json['location'] as int),
      ),
      lastResident: json['lastResident'] == null
          ? null
          : Resident.fromJsonWithID(
              json['lastResident'] as Map<String, dynamic>,
            ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location.raw,
      'time': time == null ? null : Timestamp.fromDate(time!),
      'lastResident': lastResident?.toJsonWithID(),
    };
  }
}

enum Location {
  home(1),
  freeSpace(2),
  outside(3);

  final int raw;

  String get title {
    switch (this) {
      case Location.home:
        return 'お家';
      case Location.freeSpace:
        return '事務所';
      case Location.outside:
        return '外';
    }
  }

  Color get color {
    switch (this) {
      case Location.home:
        return Colors.green[100]!;
      case Location.freeSpace:
        return Colors.yellow[100]!;
      case Location.outside:
        return Colors.red[100]!;
    }
  }

  const Location(this.raw);
}

