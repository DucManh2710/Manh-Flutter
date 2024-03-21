import 'package:flutter_application_2/models/district.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  District? district;
  
  group('Test District: ', () {
    district = District(
      id: "001",
      name: "Quận Ba Đình",
      level: "Quận",
      provinceId: "01",
    );
    expect(district?.id, equals("001"));
    expect(district?.name, equals("Quận Ba Đình"));
    expect(district?.level, equals("Quận"));
    expect(district?.provinceId, equals("01"));
  });
}