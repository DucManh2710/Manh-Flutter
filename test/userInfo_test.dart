import 'package:flutter_application_2/models/UserInfo.dart';
import 'package:flutter_application_2/models/addressInfo%20.dart';
import 'package:flutter_application_2/models/district.dart';
import 'package:flutter_application_2/models/ward.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  UserInfo? userInfo;

  group('Test UserInfo', () {
    userInfo = UserInfo(
      name:"Mạnh",
      email:"tdmanh2710@gmail.com",
      phoneNumber:"0985136103",
      birthDate: DateTime(2003, 10, 10),
      address:addressInfo(
        province: province(
          id:"01",
          name:"Thành phố Hà Nội",
          level:"Thành phố Trung ương",
        ),
        district: District(
          id: "001",
        name: "Quận Ba Đình",
        level: "Quận",
        provinceId: "01",
        ),
        ward: Ward(
          id:"00001",
        name: "Phương Phúc Xã",
        level: "Phường",
        districtId: "001",
        provinceId: "01",
        ),
        street: "Main Street"
      ),
    );
  });
}

province({required String id, required name, required String level}) {
}