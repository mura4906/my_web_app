// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userHash() => r'c2bf826cab64fdd0de7e21e1333170f1e392406e';

/// See also [User].
@ProviderFor(User)
final userProvider = AsyncNotifierProvider<User, Resident?>.internal(
  User.new,
  name: r'userProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$User = AsyncNotifier<Resident?>;
String _$guestHash() => r'2b27c1928900edf2b136de22183ec607b2128414';

/// See also [Guest].
@ProviderFor(Guest)
final guestProvider = AsyncNotifierProvider<Guest, Resident?>.internal(
  Guest.new,
  name: r'guestProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$guestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Guest = AsyncNotifier<Resident?>;
String _$residentListHash() => r'fca71bae38abf7452d0ed4d6424101130b798056';

/// See also [ResidentList].
@ProviderFor(ResidentList)
final residentListProvider =
    AsyncNotifierProvider<ResidentList, List<Resident>>.internal(
  ResidentList.new,
  name: r'residentListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$residentListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ResidentList = AsyncNotifier<List<Resident>>;
String _$keyListHash() => r'f06e542cc11fed240ac86a7f6a777d738c61ce06';

/// See also [KeyList].
@ProviderFor(KeyList)
final keyListProvider = AsyncNotifierProvider<KeyList, List<HouseKey>>.internal(
  KeyList.new,
  name: r'keyListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$keyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$KeyList = AsyncNotifier<List<HouseKey>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
