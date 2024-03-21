import 'package:flutter_application_2/models/ward.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  Ward? ward;

  group('Test Ward:', () {
    ward = Ward(
      id:"00001",
      name: "Phương Phúc Xã",
      level: "Phường",
      districtId: "001",
      provinceId: "01",
    );
    expect(ward?.id, equals("00001"));
    expect(ward?.name, equals("Phương Phúc Xã"));
    expect(ward?.level, equals("Phường"));
    expect(ward?.districtId, equals("001"));
    expect(ward?.provinceId, equals("01"));
  });
}