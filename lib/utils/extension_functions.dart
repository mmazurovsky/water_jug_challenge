import 'package:flutter/material.dart';
import 'package:water_jug_challenge/data/enums.dart';

import '../navigation/my_navigation.dart';

extension NavigationExtentions on NavigationRoute {
  static const Map<NavigationRoute, String> _pathMap = {
    NavigationRoute.main: '/main',
    NavigationRoute.solution: '/solution',
  };

  String get path => _pathMap[this]!;
}

extension RoutingExtension on String {
  Uri get getUri {
    return Uri.parse(this);
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension BucketName on Bucket {
  String getName() {
    if (this == Bucket.x) {
      return 'X';
    } else {
      return 'Y';
    }
  }

  String getNameOfAnotherBucket() {
    if (this == Bucket.x) {
      return 'Y';
    } else {
      return 'X';
    }
  }
}

extension ActionDescription on BucketAction {
  String getDescription(Bucket actionInitializerBucket) {
    if (this == BucketAction.fill) {
      return 'Fill bucket ${actionInitializerBucket.getName()}';
    } else if (this == BucketAction.empty) {
      return 'Empty bucket ${actionInitializerBucket.getName()}';
    } else {
      return 'Transfer bucket ${actionInitializerBucket.getName()} to bucket ${actionInitializerBucket.getNameOfAnotherBucket()}';
    }
  }
}
