import 'package:chaavie_customer/data/response/api_responses.dart';
import 'package:chaavie_customer/repository/address_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../model/myAddress/AddressModel.dart';

class AddressViewModel with ChangeNotifier{

  final myRepository = AddressRepository();

  ApiResponse<AddressModel> addressList = ApiResponse.loading();
  setAddressList(ApiResponse<AddressModel> response){
    addressList = response;
    notifyListeners();
  }


  Future<void>fetchAddressListApi()async{
    print('fetch address is working...');
    setAddressList(ApiResponse.loading());
    print('---------0');

    myRepository.addressList().then((value) {
      print('---------1');

      setAddressList(ApiResponse.completed(value));
      print('---------2');
    }).onError((error, stackTrace) {
      print('on error');
      setAddressList(ApiResponse.error(error.toString()));
    });
  }


}