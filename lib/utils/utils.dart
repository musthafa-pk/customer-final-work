import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';

import '../res/app_colors.dart';
import '../res/app_url.dart';
class Utils{
//greetings
  static greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning !';
    }
    if (hour < 17) {
      return 'Good Afternoon !';
    }
    return 'Good Evening !';
  }

  // next field focused in textField
  static fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode nextFocus,){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // toast message
  static toastMessage(String message){
    Fluttertoast.showToast(msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );}

  //flushbar
  static flushBarErrorMessage(String message , BuildContext context){
    showFlushbar(context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeOut,
        positionOffset: 20,
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(20),
        icon: const Icon(Icons.error ,size: 28,color: Colors.white,),
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        backgroundColor: AppColors.buttonsColor,
        messageColor: Colors.white,
        duration: const Duration(seconds: 3),
      )..show(context),
    );}

  //snackbar
  static snackBar(String message , BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(message))
    );
  }
  //googlemap
  static googleMap(BuildContext context,controller)async{

    String googleKey = AppUrl.gKey;

    var place = await PlacesAutocomplete.show(
        logo: const Text(''),
        context: context,
        apiKey: googleKey,
        mode: Mode.overlay,
        types: [],
        strictbounds: false,
        components: [
        ],
        onError: (err){
        }
    );

    if(place != null){
      controller.text = place.description.toString();

      final plist = GoogleMapsPlaces(apiKey:googleKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );

      String placeId = place.placeId ?? "0";
      final detail = await plist.getDetailsByPlaceId(placeId);
      final geometry = detail.result?.geometry!;
      var originLatitude = geometry?.location.lat;
      var originLongitude = geometry?.location.lng;
    }
  }

  //make phonecall
  static makephonecall()async{
    const phone_number = '09180867 30010';
    bool? res =  await FlutterPhoneDirectCaller.callNumber(phone_number);
  }

  //mail app
  static void showNoMailAppsDialog(BuildContext context){
    showDialog(context: context,
        builder: (context){
          return AlertDialog(
              title: Text('Open Mail App'),
              content: Text('No Mail Apps Installed'),
              actions:<Widget>[
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('OK'))
              ]
          );
        });
  }

  //date picker
  static date(BuildContext context,controller)async{
    var hour = DateTime.now().hour;

    if (hour <= 11) {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100));

      if (pickedDate != null) {
        String formattedDate = DateFormat('MM-dd-yyyy')
            .format(pickedDate);
        controller.text =
            formattedDate;
      } else {}
    } else {
      DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now().add(
              const Duration(days: 1)),
          firstDate: DateTime.now().add(
              const Duration(days: 1)),
          lastDate: DateTime(2100));

      if (pickedDate != null) {
        String formattedDate = DateFormat('MM-dd-yyyy')
            .format(pickedDate);

        controller.text =
            formattedDate;
      } else {}
    }
  }


}