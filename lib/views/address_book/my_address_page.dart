import 'package:chaavie_customer/model/myAddress/AddressModel.dart';
import 'package:chaavie_customer/view_model/address_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import '../../res/app_colors.dart';
import '../../utils/utils.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {

  AddressViewModel addressViewModel = AddressViewModel();
  @override
  void initState() {
    addressViewModel.fetchAddressListApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final addressViewModel = Provider.of<AddressViewModel>(context);

    List<String> myAddresses = [];
    var selectedAddress;

    return Scaffold(
      body: ChangeNotifierProvider<AddressViewModel>(
        create: (BuildContext context)=>addressViewModel,
        child: Consumer<AddressViewModel>(
          builder: (context,value,_){
            switch(value.addressList.status){
              case Status.Loading:
                return Center(child: CircularProgressIndicator(),);

              case Status.Error:
                return Utils.flushBarErrorMessage(value.addressList.message.toString(), context);

              case Status.Completed:
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text('MY ADDRESS BOOK',style: TextStyle(
                              color: Color.fromRGBO(1, 36, 76, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            ),
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: (){
                                },
                                child: ListTile(
                                  leading: Icon(Icons.add,color:AppColors.buttonsColor,),
                                  title: Text('Add new address',style: TextStyle(
                                      color: AppColors.buttonsColor
                                  ),),
                                ),
                              ),
                              Divider(
                                color: Colors.black12,
                              ),
                            ],
                          ),

                          // ListView.builder(
                          //     itemCount:2,
                          //     shrinkWrap: true,
                          //     itemBuilder: (context,index) {
                          //       return Column(
                          //         children: [
                          //           ListTile(
                          //             leading: Icon(Icons.add_home,color: AppColors.buttonsColor),
                          //             trailing: InkWell(
                          //                 onTap:(){
                          //                   setState(() {
                          //                     // Utils.mycurrentSelectedAddress.add(
                          //                     //     {
                          //                     //       'company_name':dataset[index]['company_name'].toString(),
                          //                     //       'address':dataset[index]['address'].toString(),
                          //                     //       'flat_no':dataset[index]['flat_no'].toString(),
                          //                     //       'district':dataset[index]['district'].toString(),
                          //                     //       'pin':dataset[index]['pin'].toString()
                          //                     //     }
                          //                     // );
                          //                     // print(Utils.mycurrentSelectedAddress);
                          //                   });
                          //                   // print(addressSelect);
                          //                 },
                          //                 child: Icon(Icons.domain_verification_rounded,color: AppColors.buttonsColor,)),
                          //             title: Text(value.addressList.data!.addressLabel![index].toString(),style: TextStyle(
                          //                 color: AppColors.buttonsColor
                          //             ),),
                          //             subtitle: Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(addressViewModel.addressList.data!.address.toString(), style: TextStyle(
                          //                   color: AppColors.buttonsColor,
                          //                 ),),
                          //                 Text('Pin:'+ addressViewModel.addressList.data!.address!.pin.toString(),style: TextStyle(
                          //                   color: AppColors.buttonsColor,
                          //                 ),),
                          //               ],
                          //             ),
                          //           ),
                          //           Divider(
                          //             color: Colors.black12,
                          //           ),
                          //         ],
                          //       );
                          //     }
                          // ),
                        ],
                      ),
                    ),
                  ),
                );

            }
            return Container();
          },
        ),
      )
    );
  }
}
