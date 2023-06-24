// //faz
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../../res/app_colors.dart';
// import '../../res/components/Booking Screen Components/custom_dropdown.dart';
// import '../../utils/utils.dart';
//
// class BookingPage2 extends StatefulWidget {
//   const BookingPage2({Key? key}) : super(key: key);
//
//   @override
//   State<BookingPage2> createState() => _BookingPage2State();
// }
//
// class _BookingPage2State extends State<BookingPage2> {
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   int currentPos = 0;
//   CarouselController controller = CarouselController();
//
//   List<WidgetByDestination> listByDestination = [ WidgetByDestination(), WidgetByDestination(),];
//   addtoDestination() {
//     if (listByDestination.length >= 5) {
//       return;
//     }
//     setState(() {
//       print(listByDestination.length);
//       listByDestination.add( WidgetByDestination());
//       print('added new widget');
//     });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 1.h,
//                     ),
//                     Text(
//                       'Shipment Details',
//                       style: TextStyle(
//                         color: AppColors.buttonsColor,
//                         fontSize: 22,
//                         fontFamily: 'ArgentumSans',
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down_outlined,
//                       color: AppColors.buttonsColor,
//                       size: 50,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               Text('------Carousel 1 start here------'),
//               CarouselSlider.builder(
//                   carouselController: controller,
//                   itemCount: listByDestination.length,
//                   itemBuilder: (context, index, realIndex) {
//                     return Column(
//                       children: [
//                         if (listByDestination.length > 1)
//                           CircleAvatar(
//                             backgroundColor: Color(0xfff05acff),
//                             child: Text(
//                               "${index + 1}",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             radius: 11,
//                           ),
//                         listByDestination[index],
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             if (listByDestination.length > 1)
//                               ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (listByDestination.length > 1) {
//                                       listByDestination.removeAt(index);
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   width: 250,
//                                   height: 100,
//                                   alignment: Alignment.center,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 8.0, right: 8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         const Text(
//                                           'Delete',
//                                           style: TextStyle(
//                                             fontFamily: 'ArgentumSans',
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                     minimumSize: const Size(130, 30),
//                                     maximumSize: const Size(130, 30),
//                                     padding: EdgeInsets.zero,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(20))),
//                               ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   _formKey;
//                                   addtoDestination();
//                                   controller.nextPage(
//                                       duration:
//                                       const Duration(milliseconds: 10),
//                                       curve: Curves.linear);
//                                   isLoading = true;
//                                 }
//
//                               },
//                               child: Container(
//                                 width: 250,
//                                 height: 100,
//                                 alignment: Alignment.center,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 8.0, right: 8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       Icon(Icons.add, size: 18),
//                                       Text(
//                                         'Destination',
//                                         style: TextStyle(
//                                           fontFamily: 'ArgentumSans',
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(130, 30),
//                                   maximumSize: const Size(130, 30),
//                                   padding: EdgeInsets.zero,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20))),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: listByDestination.map((url) {
//                             int index1 = listByDestination.indexOf(url);
//                             return InkWell(
//                               onTap: () {
//                                 setState(() {
//                                   controller.animateToPage(index1,
//                                       duration: const Duration(milliseconds: 10),
//                                       curve: Curves.linear);
//                                 });
//                               },
//                               child: Container(
//                                 width: 15.0,
//                                 height: 15.0,
//                                 margin: EdgeInsets.symmetric(
//                                     vertical: 10.0, horizontal: 2.0),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: currentPos == index1
//                                       ? Color(0xfff05acff)
//                                       : Color.fromRGBO(0, 0, 0, 0.4),
//                                 ),
//                                 // child: Center(
//                                 //   child: Text('${index + 1}',
//                                 //   style: TextStyle(fontSize: 10)),),
//                               ),
//                             );
//                           }).toList(),
//                         )
//                       ],
//                     );
//                   },
//                   options: CarouselOptions(
//                     onPageChanged: (val, _) {
//                       setState(() {
//                         currentPos = val;
//                         controller.jumpToPage(val);
//                       });
//                     },
//                     scrollPhysics: AlwaysScrollableScrollPhysics(),
//                     height: 900,
//                     enlargeCenterPage: true,
//                     autoPlay: false,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: false,
//                     autoPlayAnimationDuration: Duration(milliseconds: 800),
//                     viewportFraction: 1.0,
//                   )),
//
//               Text('----end of 1st carousal------'),
//               //total data by column
//               Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: MediaQuery.of(context).size.width,
//                       child: Table(
//                         columnWidths: {
//                           0: const FlexColumnWidth(4),
//                           1: const FlexColumnWidth(2),
//                         },
//                         border: TableBorder.all(color: Colors.black,width: 0.5,
//                             borderRadius: BorderRadius.circular(10)),
//                         children: [
//                           TableRow(
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Center(child:  Text(
//                                   'Total Item',
//                                   style:TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: Colors.black54,
//                                   ),
//                                 ),),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(child: Text(
//                                   'Some Count',
//                                   style:const TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: Colors.black54,
//                                   ),
//                                 )),
//                               ),
//                             ],),
//
//                           TableRow(
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Center(child:  Text(
//                                   'Total Weight',
//                                   style:TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: Colors.black54,
//                                   ),
//                                 ),),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(child: Text(
//                                   'some weight',
//                                   style:const TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: Colors.black54,
//                                   ),
//                                 )),
//                               ),
//                             ],),
//                           TableRow(
//                             children: [
//                               const Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Center(
//                                     child: Text('Chargeable Weight',
//                                       style:TextStyle(
//                                         fontFamily: 'ArgentumSans',
//                                         color: Colors.white,
//                                         // (0XFFF01244C),
//                                       ),)),
//                               ),
//
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: Center(child: Text('50.00',
//                                   // Text('${chargeableWeight == null
//                                   //     ? '50' : chargeableWeight.toStringAsFixed(
//                                   //     2)} kg',
//                                   style:const TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: Colors.white,
//                                     // (0XFFF01244C),
//                                   ),),),
//                               ),
//                             ],
//                             decoration: const BoxDecoration(color: Color(0xfff05acff),
//                               borderRadius:BorderRadius.only(
//                                 bottomLeft:Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//
//               SizedBox(height:2.h),
//
//               Center(
//                   child:InkWell(
//                     onTap: (){
//                     },
//                     child: Container(
//                         decoration:BoxDecoration(
//                           color:AppColors.buttonsColor,
//                           borderRadius: BorderRadius.circular(200),
//                         ),
//                         child:Padding(
//                           padding: const EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
//                           child: Text('Calculate Price',style:TextStyle(
//                               color:Colors.white
//                           )),
//                         )
//                     ),
//                   )
//               ),
//
//               SizedBox(height:2.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class WidgetByDestination extends StatelessWidget {
//   const WidgetByDestination({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String dropSelected;
//
//     List<CollectDataWidget> listByDataCollect = [new CollectDataWidget()];
//
//     CarouselController controller1 = CarouselController();
//     bool isLoading1 = false;
//
//     int currentPos1 = 0;
//
//     addtoDataCollect() {
//       if (listByDataCollect.length >= 5) {
//         return;
//       }
//       listByDataCollect.add(CollectDataWidget());
//     };
//     return StatefulBuilder(
//       builder: (context, setState) {
//         setState(() {});
//         return Container(
//           margin: const EdgeInsets.only(left: 5, right: 5),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Drop Location',
//                 style: TextStyle(
//                   color: Colors.black54,
//                 ),
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(25),
//                       border:
//                       Border.all(width: 1, color: AppColors.buttonsColor)),
//                   child: CustomDropdown(
//                     options: ['one', 'two', 'three'],
//                     hintText: 'Select address',
//                     onChanged: (values) {
//                       setState(() {
//                         dropSelected = values;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//
//               SizedBox(
//                 height: 1.h,
//               ),
//               Text('carousal 2 start here'),
//
//               CarouselSlider.builder(
//                   itemCount: listByDataCollect.length,
//                   itemBuilder: (context, index, realIndex) {
//                     return Column(
//                       children: [
//                         if (listByDataCollect.length > 1)
//                           CircleAvatar(
//                             backgroundColor: Color(0xfff05acff),
//                             child: Text(
//                               "${index + 1}",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             radius: 11,
//                           ),
//                         listByDataCollect[index],
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             if (listByDataCollect.length > 1)
//                               ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (listByDataCollect.length > 1) {
//                                       listByDataCollect.removeAt(index);
//                                     }
//                                   });
//                                 },
//                                 child: Container(
//                                   width: 250,
//                                   height: 100,
//                                   alignment: Alignment.center,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 8.0, right: 8.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.center,
//                                       children: [
//                                         const Text(
//                                           'Delete',
//                                           style: TextStyle(
//                                             fontFamily: 'ArgentumSans',
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                 ),
//                                 style: ElevatedButton.styleFrom(
//                                     minimumSize: const Size(130, 30),
//                                     maximumSize: const Size(130, 30),
//                                     padding: EdgeInsets.zero,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                         BorderRadius.circular(20))),
//                               ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 // if (_formKey.currentState!.validate()) {
//                                 //   _formKey;
//                                 setState(() {
//                                   addtoDataCollect();
//
//                                 });
//                                 controller1.nextPage(
//                                     duration: const Duration(milliseconds: 10),
//                                     curve: Curves.linear);
//                                 isLoading1 = true;
//                                 //
//                                 // }
//                               },
//                               child: Container(
//                                 width: 250,
//                                 height: 100,
//                                 alignment: Alignment.center,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 8.0, right: 8.0),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: const [
//                                       Icon(Icons.add, size: 18),
//                                       Text(
//                                         'Add More',
//                                         style: TextStyle(
//                                           fontFamily: 'ArgentumSans',
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(130, 30),
//                                   maximumSize: const Size(130, 30),
//                                   padding: EdgeInsets.zero,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(20))),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: listByDataCollect.map((url) {
//                             int index2 = listByDataCollect.indexOf(url);
//                             return InkWell(
//                               onTap: () {
//                                 controller1.animateToPage(index2,
//                                     duration: const Duration(milliseconds: 10),
//                                     curve: Curves.linear);
//                               },
//                               child: Container(
//                                 width: 15.0,
//                                 height: 15.0,
//                                 margin: EdgeInsets.symmetric(
//                                     vertical: 10.0, horizontal: 2.0),
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: currentPos1 == index2
//                                       ? Color(0xfff05acff)
//                                       : Color.fromRGBO(0, 0, 0, 0.4),
//                                 ),
//                                 // child: Center(
//                                 //   child: Text('${index + 1}',
//                                 //   style: TextStyle(fontSize: 10)),),
//                               ),
//                             );
//                           }).toList(),
//                         )
//                       ],
//                     );
//                   },
//                   options: CarouselOptions(
//                     onPageChanged: (value, _) {
//                       setState(() {
//                         currentPos1 = value;
//                         controller1.jumpToPage(value);
//                       });
//                     },
//                     scrollPhysics: AlwaysScrollableScrollPhysics(),
//                     height: 600,
//                     enlargeCenterPage: true,
//                     autoPlay: false,
//                     aspectRatio: 16 / 9,
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enableInfiniteScroll: false,
//                     autoPlayAnimationDuration: Duration(milliseconds: 800),
//                     viewportFraction: 1.0,
//                   )),
//               Text('carousel 2 ends here'),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
//
//
// class CollectDataWidget extends StatelessWidget {
//   const CollectDataWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final _formKey2 = GlobalKey<FormState>();
//
//     TextEditingController count = TextEditingController();
//     TextEditingController length = TextEditingController();
//     TextEditingController width = TextEditingController();
//     TextEditingController height = TextEditingController();
//     TextEditingController weight = TextEditingController();
//     TextEditingController p_details = TextEditingController();
//
//     List<TextEditingController> textControllers = [];
//
//     int numberOfControllers = 3; // Adjust the number as needed
//
//     for (int i = 0; i < numberOfControllers; i++) {
//
//       textControllers.add(TextEditingController());
//     }
//
//     List<String> controllerValues = [];
//
//     for (var controller in textControllers) {
//       controllerValues.add(controller.text);
//     }
//
//
//
//     FocusNode countNode = FocusNode();
//     FocusNode lengthNode = FocusNode();
//     FocusNode widthNode = FocusNode();
//     FocusNode heightNode = FocusNode();
//     FocusNode weightNode = FocusNode();
//
//     FocusNode p_details_Node = FocusNode();
//
//     bool carton_selected = false;
//     bool bag_or_sack_selected = false;
//     bool others_selected = false;
//     String? typeSelected = '';
//
//     bool small = false;
//     bool medioum = false;
//     bool large = false;
//     bool xl = false;
//     String? sizeSelected = '';
//
//     String? type = 'carton';
//     String size = 'small';
//
//     return StatefulBuilder(
//       builder: (context, refresh) {
//         refresh(() {
//
//         });
//         return Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Product Details',
//                 style: TextStyle(color: Colors.black54),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10),
//                 child: Container(
//                   height:40,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: AppColors.buttonsColor),
//                     borderRadius: BorderRadius.circular(100),
//                   ),
//                   child: Padding(
//                       padding: const EdgeInsets.only(left: 10.0,bottom:5.0),
//                       child: Column(
//                         children: textControllers.map((controller) {
//                           return TextField(
//                             controller: controller,
//                             decoration: InputDecoration(border: InputBorder.none),
//                             // Other TextField properties...
//                           );
//                         }).toList(),
//                       )
//                   ),
//                 ),
//               ),
//               Text(
//                 'Type',
//                 style: TextStyle(
//                   fontFamily: "ArgentumSans",
//                   color: Colors.black54,
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20),
//                 child: Container(
//                   // width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1, color: AppColors.buttonsColor),
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             carton_selected == false
//                                 ? carton_selected = true
//                                 : carton_selected = false;
//                             bag_or_sack_selected = false;
//                             others_selected = false;
//                             type = 'carton';
//                             print('$type' + 'selected');
//                           });
//                         },
//                         child: Container(
//                           width: 100,
//                           decoration: BoxDecoration(
//                               color: carton_selected == false
//                                   ? Colors.white
//                                   : AppColors.buttonsColor,
//                               borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(25),
//                                   bottomLeft: Radius.circular(25))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Text(
//                                 'Carton',
//                                 style: TextStyle(
//                                   fontFamily: 'ArgentumSans',
//                                   color: carton_selected == false
//                                       ? AppColors.buttonsColor
//                                       : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             bag_or_sack_selected == false
//                                 ? bag_or_sack_selected = true
//                                 : bag_or_sack_selected = false;
//                             carton_selected = false;
//                             others_selected = false;
//                             type = 'bag/sack';
//                             print('$type' + 'selected');
//                           });
//                         },
//                         child: Container(
//                           width: 100,
//                           decoration: BoxDecoration(
//                             color: bag_or_sack_selected == false
//                                 ? Colors.white
//                                 : AppColors.buttonsColor,
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Text(
//                                 'Bag/Sack',
//                                 style: TextStyle(
//                                   fontFamily: 'ArgentumSans',
//                                   color: bag_or_sack_selected == false
//                                       ? AppColors.buttonsColor
//                                       : Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             others_selected == true
//                                 ? others_selected = false
//                                 : others_selected = true;
//                             carton_selected = false;
//                             bag_or_sack_selected = false;
//                             type = 'others';
//                             print('$type' + 'Selected');
//                           });
//                         },
//                         child: Container(
//                           width: 100,
//                           decoration: BoxDecoration(
//                               color: others_selected == false
//                                   ? Colors.white
//                                   : AppColors.buttonsColor,
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(25),
//                                   bottomRight: Radius.circular(25))),
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Center(
//                               child: Text(
//                                 'Others',
//                                 style: TextStyle(
//                                     fontFamily: 'ArgentumSans',
//                                     color: others_selected == false
//                                         ? AppColors.buttonsColor
//                                         : Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 1.h,
//               ),
//               others_selected == false
//                   ? Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Size',
//                     style: TextStyle(
//                       fontFamily: "ArgentumSans",
//                       color: Colors.black54,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   bag_or_sack_selected == true
//                       ? Padding(
//                     padding:
//                     const EdgeInsets.only(left: 20, right: 20),
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                             width: 1,
//                             color: AppColors.buttonsColor),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: Row(
//                         mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               refresh(() {
//                                 small == false
//                                     ? small = true
//                                     : small = false;
//                                 medioum = false;
//                                 large = false;
//                                 size = 'small';
//                                 print('$size' + ' selcted');
//                               });
//                             },
//                             child: Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                   color: small == false
//                                       ? Colors.white
//                                       : AppColors.buttonsColor,
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(25),
//                                       bottomLeft:
//                                       Radius.circular(25))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(
//                                   child: Text(
//                                     'Small',
//                                     style: TextStyle(
//                                       fontFamily: 'ArgentumSans',
//                                       color: small == false
//                                           ? AppColors.buttonsColor
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               refresh(() {
//                                 medioum == false
//                                     ? medioum = true
//                                     : medioum = false;
//                                 small = false;
//                                 large = false;
//                                 size = 'medium';
//                                 print('$size' + ' selected');
//                               });
//                             },
//                             child: Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 color: medioum == false
//                                     ? Colors.white
//                                     : AppColors.buttonsColor,
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(
//                                   child: Text(
//                                     'Medium',
//                                     style: TextStyle(
//                                       fontFamily: 'ArgentumSans',
//                                       color: medioum == false
//                                           ? AppColors.buttonsColor
//                                           : Colors.black,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               refresh(() {
//                                 large == true
//                                     ? large = false
//                                     : large = true;
//                                 small = false;
//                                 medioum = false;
//                                 size = 'large';
//                                 print('$Utils.size' + ' selected');
//                               });
//                             },
//                             child: Container(
//                               width: 100,
//                               decoration: BoxDecoration(
//                                   color: large == false
//                                       ? Colors.white
//                                       : AppColors.buttonsColor,
//                                   borderRadius: BorderRadius.only(
//                                       topRight: Radius.circular(25),
//                                       bottomRight:
//                                       Radius.circular(25))),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Center(
//                                   child: Text(
//                                     'Large',
//                                     style: TextStyle(
//                                         fontFamily: 'ArgentumSans',
//                                         color: large == false
//                                             ? AppColors.buttonsColor
//                                             : Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                       : Container(),
//                   bag_or_sack_selected == true
//                       ? Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           Text('Count',
//                               style:
//                               TextStyle(color: Colors.black54)),
//                           SizedBox(
//                               width: 100,
//                               height: 40,
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius.circular(100),
//                                     border: Border.all(
//                                         width: 1,
//                                         color:
//                                         AppColors.buttonsColor),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10,
//                                         bottom: 5,
//                                         right: 10),
//                                     child: Center(
//                                       child: TextFormField(
//                                         controller: count,
//                                         focusNode: countNode,
//                                         textAlign: TextAlign.right,
//                                         decoration: InputDecoration(
//                                           border: InputBorder.none,
//                                         ),
//                                       ),
//                                     ),
//                                   ))),
//                         ],
//                       ),
//                       SizedBox(
//                           height: 100,
//                           child: Image.asset(
//                               './assets/images/sack.png')),
//                       small == true
//                           ? Text(
//                         '10 kg',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: AppColors.buttonsColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                           : Container(),
//                       medioum == true
//                           ? Text(
//                         '20 kg',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: AppColors.buttonsColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                           : Container(),
//                       large == true
//                           ? Text(
//                         '50 kg',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: AppColors.buttonsColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                           : Container(),
//                     ],
//                   )
//                       : Container(),
//                   SizedBox(height: 1.h),
//                   carton_selected == true
//                       ? Row(
//                     mainAxisAlignment:
//                     MainAxisAlignment.spaceAround,
//                     children: [
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             small = true;
//                             medioum = false;
//                             large = false;
//                             xl = false;
//                           });
//                           print('small selected');
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: small == true
//                                     ? AppColors.buttonsColor
//                                     : Color.fromRGBO(10, 8, 100, 1),
//                                 borderRadius:
//                                 BorderRadius.circular(15),
//                               ),
//                               child: SizedBox(
//                                   height: 90,
//                                   width: 90,
//                                   child: Image.asset(
//                                       './assets/images/smallman.png')),
//                             ),
//                             small == true
//                                 ? Text(
//                               'SMALL',
//                             )
//                                 : Text(''),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             small = false;
//                             medioum = true;
//                             large = false;
//                             xl = false;
//                           });
//
//                           print('Medium selected');
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: medioum == true
//                                     ? AppColors.buttonsColor
//                                     : Color.fromRGBO(10, 8, 100, 1),
//                                 borderRadius:
//                                 BorderRadius.circular(15),
//                               ),
//                               child: SizedBox(
//                                   height: 90,
//                                   width: 90,
//                                   child: Image.asset(
//                                       './assets/images/mediumman.png')),
//                             ),
//                             medioum == true
//                                 ? Text('Medium')
//                                 : Text(''),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             small = false;
//                             medioum = false;
//                             large = true;
//                             xl = false;
//                           });
//
//                           print('Large selected');
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: large == true
//                                     ? AppColors.buttonsColor
//                                     : Color.fromRGBO(10, 8, 100, 1),
//                                 borderRadius:
//                                 BorderRadius.circular(15),
//                               ),
//                               child: SizedBox(
//                                   height: 90,
//                                   width: 90,
//                                   child: Image.asset(
//                                       './assets/images/largeman.png')),
//                             ),
//                             large == true
//                                 ? Text('Large')
//                                 : Text(''),
//                           ],
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           refresh(() {
//                             small = false;
//                             medioum = false;
//                             large = false;
//                             xl = true;
//                           });
//                           print('extra large');
//                         },
//                         child: Column(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                 color: xl == true
//                                     ? AppColors.buttonsColor
//                                     : Color.fromRGBO(10, 8, 100, 1),
//                                 borderRadius:
//                                 BorderRadius.circular(15),
//                               ),
//                               child: SizedBox(
//                                   height: 90,
//                                   width: 90,
//                                   child: Image.asset(
//                                       './assets/images/extralarge man.png')),
//                             ),
//                             xl == true ? Text('X Large') : Text(''),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )
//                       : Container(),
//                   SizedBox(height: 1.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       carton_selected == true
//                           ? Column(
//                         children: [
//                           Text(
//                             'Count',
//                             style: TextStyle(color: Colors.black54),
//                           ),
//                           SizedBox(
//                             width: 120,
//                             height: 40,
//                             child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius:
//                                   BorderRadius.circular(100),
//                                   border: Border.all(
//                                       width: 1,
//                                       color:
//                                       AppColors.buttonsColor),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10,
//                                       bottom: 5,
//                                       right: 10),
//                                   child: TextFormField(
//                                     controller: count,
//                                     focusNode: countNode,
//                                     textAlign: TextAlign.right,
//                                     keyboardType:
//                                     TextInputType.number,
//                                     decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                     ),
//                                   ),
//                                 )),
//                           ),
//                         ],
//                       )
//                           : Text(''),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 5,left: 50),
//                         child: Text("Price: ₹${100000}",
//                             style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontWeight: FontWeight.bold
//                             )),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 1.h),
//                 ],
//               )
//                   : Column(
//                 children: [
//                   Text(
//                     "Provide Dimensions",
//                     style: TextStyle(
//                       color: AppColors.buttonsColor,
//                       fontFamily: 'ArgentumSans',
//                     ),
//                   ),
//                   SizedBox(
//                     height: 1.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             'Length',
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontFamily: 'ArgentumSans'),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Container(
//                             width: 100,
//                             height: 30,
//                             decoration: BoxDecoration(
//                                 border: Border.all(
//                                     width: 1,
//                                     color: AppColors.buttonsColor),
//                                 borderRadius: BorderRadius.circular(25)),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: length,
//                                 focusNode: lengthNode,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none),
//                                 onFieldSubmitted: (value) {
//                                   Utils.fieldFocusChange(
//                                       context, lengthNode, widthNode);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             'width',
//                             style: TextStyle(
//                               fontFamily: 'ArgentumSans',
//                               color: Colors.black54,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Container(
//                             width: 100,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1,
//                                   color: AppColors.buttonsColor),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: width,
//                                 focusNode: widthNode,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none),
//                                 onFieldSubmitted: (value) {
//                                   Utils.fieldFocusChange(
//                                       context, widthNode, heightNode);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             'Height',
//                             style: TextStyle(
//                                 fontFamily: 'ArgentumSans',
//                                 color: Colors.black54),
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Container(
//                             width: 100,
//                             height: 30,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1,
//                                   color: AppColors.buttonsColor),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(left: 10.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: height,
//                                 focusNode: heightNode,
//                                 decoration: InputDecoration(
//                                     border: InputBorder.none),
//                                 onFieldSubmitted: (value) {
//                                   Utils.fieldFocusChange(
//                                       context, heightNode, weightNode);
//                                 },
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               others_selected == true
//                   ? Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         'Count',
//                         style: TextStyle(color: Colors.black54),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10.0),
//                         child: SizedBox(
//                           width: 120,
//                           height: 30,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                   width: 1, color: AppColors.buttonsColor),
//                               borderRadius: BorderRadius.circular(25),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 10,
//                                 right: 10,
//                               ),
//                               child: TextFormField(
//                                 textAlign: TextAlign.right,
//                                 keyboardType: TextInputType.number,
//                                 decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 20,right: 20),
//                     child: Text("Price: ₹${100000}",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold
//                         )),
//                   ),
//                 ],
//               )
//                   : Text(''),
//
//               SizedBox(height: 1.h,),
//
//               InkWell(
//                 onTap: (){
//
//                 },
//                 child: Container(
//                   decoration:BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text('Calculate Price',style: TextStyle(
//                         color: Colors.white
//                     ),),
//                   ),),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
//
// }
