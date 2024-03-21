
import 'package:flutter_application_2/models/province.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  Province? province;

  group('Test Province:', () { 
    province = Province(
      id: "01",
      name: "Thành phố Hà Nội",
      level: "Thành phố Trung ương",
    );
    expect(province?.id, equals("01"));
    expect(province?.name, equals("Thành phố Hà Nội"));
    expect(province?.level, equals("Thành phố Trung ương"));
  });
}