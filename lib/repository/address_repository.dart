import 'dart:convert';

import 'package:chaavie_customer/data/network/base_api_services.dart';
import 'package:chaavie_customer/data/network/network_api_services.dart';
import 'package:chaavie_customer/res/app_url.dart';

import '../model/myAddress/AddressModel.dart';

class AddressRepository{
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic>addressList()async{
   try{
      print('api calling is working');
      dynamic response = await apiServices.getAPiResponse('http://192.168.190.1:3000/addressbook/85/');
      print('----repository 0001');

      dynamic res = AddressModel.fromJson(response);
      print('repo--0002');
      print(jsonDecode(res));
      return res;
     // return response = AddressModel.fromJson(response);

    }catch(e){
     print('repo error');
    throw e;
  }
  }

}