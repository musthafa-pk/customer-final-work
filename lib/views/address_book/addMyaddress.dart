import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/app_colors.dart';
import '../../res/app_url.dart';
import '../../res/components/Booking Screen Components/custom_dropdown.dart';
import '../../utils/utils.dart';
class AddMyAddressPage extends StatefulWidget {
  const AddMyAddressPage({Key? key}) : super(key: key);

  @override
  State<AddMyAddressPage> createState() => _AddMyAddressPageState();
}

class _AddMyAddressPageState extends State<AddMyAddressPage> {

  TextEditingController trade_name = TextEditingController();
  TextEditingController bldngno = TextEditingController();
  TextEditingController locality = TextEditingController();
  TextEditingController contact = TextEditingController();

  FocusNode trade_name_node = FocusNode();
  FocusNode bldngno_node = FocusNode();
  FocusNode locality_node = FocusNode();
  FocusNode contact_node = FocusNode();

  var pickupLocation;

  String? selectedDistrict;

  List<String> districts = ['a','b','c'];

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(

      body: SingleChildScrollView(
        child: SafeArea(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Add New Address',style: TextStyle(
                      color: AppColors.buttonsColor,
                      fontSize: 24.sp,
                      fontFamily: 'ArgentumSans'
                  ),),
                  SizedBox(height: 1.h,),

                  Icon(Icons.keyboard_arrow_down_outlined,color: AppColors.buttonsColor,size: 28.sp,),

                  SizedBox(height: 1.h,),

                  Text('Trade Name',style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.sp,
                      fontFamily: 'ArgentumSans'
                  ),),

                  SizedBox(height: 1.h,),

                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: AppColors.buttonsColor),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextFormField(
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return Utils.flushBarErrorMessage('Please enter Trade name', context);
                              }
                              return null;
                            },
                            controller: trade_name,
                            focusNode: trade_name_node,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onFieldSubmitted: (value){
                              Utils.fieldFocusChange(context, trade_name_node, bldngno_node);
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h,),

                  Text('Bldg No / Street Name',style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.sp,
                    fontFamily: 'ArgentumSans',
                  ),),

                  SizedBox(height: 1.h,),

                  Padding(
                    padding: const EdgeInsets.only(left:10,right: 10),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: AppColors.buttonsColor),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 5),
                        child: TextFormField(
                          onTap: ()async{
                            var place = await PlacesAutocomplete.show(
                                logo: Text(""),
                                context: context,
                                apiKey: AppUrl.gKey,
                                mode: Mode.overlay,
                                types: [],
                                strictbounds: false,
                                components:[
                                  Component(Component.country, 'ind')],
                                onError: (err){
                                  print('error');
                                });
                            if(place!=null){
                              setState(() {
                                bldngno.text = place.description.toString();
                              });
                              final plist = GoogleMapsPlaces(apiKey: AppUrl.gKey,
                                  apiHeaders: await GoogleApiHeaders().getHeaders());
                              String placeid = place.placeId ?? '0';
                              final detail = await plist.getDetailsByPlaceId(placeid);
                              final geometry  = detail.result.geometry;
                              var pickupLatitude = geometry?.location.lat;
                              var pickupLongitude = geometry?.location.lng;
                              bldngno = pickupLocation;
                            }

                          },
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return Utils.flushBarErrorMessage('Please enter Building Number', context);
                            }
                            return null;
                          },
                          controller: bldngno,
                          focusNode: bldngno_node,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onFieldSubmitted: (value){
                            Utils.fieldFocusChange(context, bldngno_node, locality_node);
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 4.h,),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: SizedBox(width: 150,
                          child: Column(
                            children: [
                              Text('District',style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'ArgentumSans',
                                  fontSize: 16.sp),),

                              SizedBox(height: 1.h,),

                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border:Border.all(width: 1,color: AppColors.buttonsColor),
                                ),
                                child: CustomDropdown(
                                    hintText: selectedDistrict.toString(),
                                    options:districts,
                                    onChanged: (value){
                                      setState(() {
                                        selectedDistrict = value;
                                      });
                                    }),
                              ),
                            ],
                          ),),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(width: 150,
                          child: Column(
                            children: [
                              Text('Locality',style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'ArgentumSans',
                                  fontSize: 16.sp
                              ),),

                              SizedBox(height: 1.h,),

                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: AppColors.buttonsColor),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return Utils.flushBarErrorMessage('Please fill pincode field', context);
                                      }
                                      return null;
                                    },
                                    controller: locality,
                                    focusNode: locality_node,
                                    onFieldSubmitted: (value){
                                      Utils.fieldFocusChange(context, locality_node, contact_node);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),),
                      ),
                    ],
                  ),

                  SizedBox(height: 4.h,),

                  Text('Contact',style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'ArgentumSans',
                    fontSize: 16.sp,
                  ),),

                  SizedBox(height: 1.h,),

                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color:AppColors.buttonsColor),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return Utils.flushBarErrorMessage('Please fill contact field', context);
                              }
                              return null;
                            },
                            controller: contact,
                            focusNode: contact_node,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            try{
                              // Utils.addAddress(trade_name,bldngno,pickupLocation,selectedDistrict,contact,selectedDistrict);
                            }catch(e)
                            {
                              throw e;
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('New Recipient added!',style: TextStyle(
                                    color: Colors.white,
                                  ),),
                                  backgroundColor: AppColors.buttonsColor,)
                            );
                          }
                        },
                        child: SizedBox(width: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.buttonsColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: SizedBox(height:50,
                                child: Lottie.asset('assets/lottie/lf30_editor_jlqta0sn.json')),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
