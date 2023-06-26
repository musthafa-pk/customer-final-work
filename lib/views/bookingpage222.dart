//
// import 'package:flutter/material.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import '../res/app_colors.dart';
// import '../res/components/Booking Screen Components/custom_dropdown.dart';
// import '../utils/utils.dart';
//
// class BookingPage222 extends StatefulWidget {
//   const BookingPage222({Key? key}) : super(key: key);
//
//   @override
//   State<BookingPage222> createState() => _BookingPage222State();
// }
//
// class _BookingPage222State extends State<BookingPage222> {
//
//   TextEditingController productDetail = TextEditingController();
//   TextEditingController count = TextEditingController();
//   TextEditingController length = TextEditingController();
//   TextEditingController width = TextEditingController();
//   TextEditingController height = TextEditingController();
//   TextEditingController weight = TextEditingController();
//
//   FocusNode countNode = FocusNode();
//   FocusNode lengthNode = FocusNode();
//   FocusNode widthNode = FocusNode();
//   FocusNode heightNode = FocusNode();
//   FocusNode weightNode = FocusNode();
//   FocusNode productNode = FocusNode();
//
//   String type = 'Carton';
//   String cartonSize = 'S';
//   String bagorsackSize = 'S';
//
//
//   bool carton_selected = true;
//   bool bag_or_sack_selected = false;
//   bool others_selected = false;
//
//   bool small = false;
//   bool medioum = false;
//   bool large = false;
//   bool xl = false;
//
//   List<dynamic> firstlist = [0];
//   List<dynamic> secondlist = [0];
//
//   String? dropSelected;
//
//   addtoDestination(){
//     if(firstlist.length>5){
//       return;
//     }
//     firstlist.add('item');
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(left: 20,right: 20.0),
//             child: Column(
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Text(
//                         'Shipment Details',
//                         style: TextStyle(
//                           color: AppColors.buttonsColor,
//                           fontSize: 22,
//                           fontFamily: 'ArgentumSans',
//                         ),
//                       ),
//                       Icon(
//                         Icons.arrow_drop_down_outlined,
//                         color: AppColors.buttonsColor,
//                         size: 50,
//                       )
//                     ],
//                   ),
//                 ),
//
//                 Container(
//                   height: 500,
//                   width: 400,
//                   decoration: BoxDecoration(
//                     color:Color.fromRGBO(25, 55, 5, 1.0)
//                   ),
//                   child: ListView.builder(
//                     itemCount: 3,
//
//                     itemBuilder: (context,index) {
//                       return Container(
//                         child: Column(
//                           children: [
//                             Text(
//                               'Drop Location',
//                               style: TextStyle(
//                                 color: Colors.black54,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2.h,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(left: 10, right: 10),
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(25),
//                                     border:
//                                     Border.all(width: 1, color: AppColors.buttonsColor)),
//                                 child: CustomDropdown(
//                                   options: ['one', 'two', 'three'],
//                                   hintText: 'Select address',
//                                   onChanged: (values) {
//                                     setState(() {
//                                       dropSelected = values;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 1.h,
//                             ),
//                             Container(
//                               height: 400,
//                               width: 500,
//                               child: ListView.builder(
//                                 itemCount: 2,
//                                 scrollDirection: Axis.horizontal,
//                                 shrinkWrap: true,
//                                 itemBuilder: (context,index) {
//                                   return Container(
//                                     child: Column(
//                                       children: [
//                                         Container(
//                                           decoration: BoxDecoration(
//                                             border: Border.all(width:1,color: AppColors.buttonsColor)
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               Text(
//                                                 'Type',
//                                                 style: TextStyle(
//                                                   fontFamily: "ArgentumSans",
//                                                   color: Colors.black54,
//                                                 ),
//                                               ),
//                                               SizedBox(height: 1.h,),
//
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left: 20, right: 20),
//                                                 child: Container(
//                                                   // width: MediaQuery.of(context).size.width,
//                                                   decoration: BoxDecoration(
//                                                     border: Border.all(width: 1, color: AppColors.buttonsColor),
//                                                     borderRadius: BorderRadius.circular(25),
//                                                   ),
//                                                   child: Row(
//                                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                     children: [
//                                                       InkWell(
//                                                         onTap: () {
//
//                                                             setState(() {
//                                                               carton_selected == false
//                                                                   ? carton_selected = true
//                                                                   : carton_selected = false;
//                                                               bag_or_sack_selected = false;
//                                                               others_selected = false;
//                                                               type = 'carton';
//                                                               print('$type' + 'selected');
//                                                             });
//
//                                                         },
//                                                         child: Container(
//                                                           width: 100,
//                                                           decoration: BoxDecoration(
//                                                               color: carton_selected == false
//                                                                   ? Colors.white
//                                                                   : AppColors.buttonsColor,
//                                                               borderRadius: BorderRadius.only(
//                                                                   topLeft: Radius.circular(25),
//                                                                   bottomLeft: Radius.circular(25))),
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.all(8.0),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'Carton',
//                                                                 style: TextStyle(
//                                                                   fontFamily: 'ArgentumSans',
//                                                                   color: carton_selected == false
//                                                                       ? AppColors.buttonsColor
//                                                                       : Colors.black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       InkWell(
//                                                         onTap: () {
//
//                                                             setState(() {
//                                                               bag_or_sack_selected == false
//                                                                   ? bag_or_sack_selected = true
//                                                                   : bag_or_sack_selected = false;
//                                                               carton_selected = false;
//                                                               others_selected = false;
//                                                               type = 'bag/sack';
//                                                               print('$type' + 'selected');
//                                                             });
//
//                                                         },
//                                                         child: Container(
//                                                           width: 100,
//                                                           decoration: BoxDecoration(
//                                                             color: bag_or_sack_selected == false
//                                                                 ? Colors.white
//                                                                 : AppColors.buttonsColor,
//                                                           ),
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.all(8.0),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'Bag/Sack',
//                                                                 style: TextStyle(
//                                                                   fontFamily: 'ArgentumSans',
//                                                                   color: bag_or_sack_selected == false
//                                                                       ? AppColors.buttonsColor
//                                                                       : Colors.black,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       InkWell(
//                                                         onTap: () {
//
//                                                             setState(() {
//                                                               others_selected == true
//                                                                   ? others_selected = false
//                                                                   : others_selected = true;
//                                                               carton_selected = false;
//                                                               bag_or_sack_selected = false;
//                                                               type = 'others';
//                                                               print('$type' + 'Selected');
//                                                             });
//
//                                                         },
//                                                         child: Container(
//                                                           width: 100,
//                                                           decoration: BoxDecoration(
//                                                               color: others_selected == false
//                                                                   ? Colors.white
//                                                                   : AppColors.buttonsColor,
//                                                               borderRadius: BorderRadius.only(
//                                                                   topRight: Radius.circular(25),
//                                                                   bottomRight: Radius.circular(25))),
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.all(8.0),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 'Others',
//                                                                 style: TextStyle(
//                                                                     fontFamily: 'ArgentumSans',
//                                                                     color: others_selected == false
//                                                                         ? AppColors.buttonsColor
//                                                                         : Colors.black),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//
//                                               SizedBox(height: 1.h,),
//                                               carton_selected ==   true ?
//                                               Padding(
//                                                 padding: const EdgeInsets.only(top: 10.0),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                                   children: [
//                                                     InkWell(
//                                                       onTap: () {
//
//                                                           setState(() {
//                                                             small = true;
//                                                             medioum = false;
//                                                             large = false;
//                                                             xl = false;
//                                                             cartonSize='S';
//                                                           });
//
//                                                         print('small selected');
//                                                       },
//                                                       child: Column(
//                                                         children: [
//                                                           Container(
//                                                             decoration: BoxDecoration(
//                                                               color: small == true
//                                                                   ? AppColors.buttonsColor
//                                                                   : Color.fromRGBO(10, 8, 100, 1),
//                                                               borderRadius:
//                                                               BorderRadius.circular(15),
//                                                             ),
//                                                             child: SizedBox(
//                                                                 height: 80,
//                                                                 width: 80,
//                                                                 child: Image.asset(
//                                                                     './assets/images/smallman.png')),
//                                                           ),
//                                                           small == true
//                                                               ? Text(
//                                                             'SMALL',
//                                                           )
//                                                               : Text(''),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           small = false;
//                                                           medioum = true;
//                                                           large = false;
//                                                           xl = false;
//                                                           cartonSize = 'M';
//                                                         });
//
//                                                         print('Medium selected');
//                                                       },
//                                                       child: Column(
//                                                         children: [
//                                                           Container(
//                                                             decoration: BoxDecoration(
//                                                               color: medioum == true
//                                                                   ? AppColors.buttonsColor
//                                                                   : Color.fromRGBO(10, 8, 100, 1),
//                                                               borderRadius:
//                                                               BorderRadius.circular(15),
//                                                             ),
//                                                             child: SizedBox(
//                                                                 height: 80,
//                                                                 width: 80,
//                                                                 child: Image.asset(
//                                                                     './assets/images/mediumman.png')),
//                                                           ),
//                                                           medioum == true
//                                                               ? Text('Medium')
//                                                               : Text(''),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           small = false;
//                                                           medioum = false;
//                                                           large = true;
//                                                           xl = false;
//                                                           cartonSize = 'L';
//                                                         });
//
//                                                         print('Large selected');
//                                                       },
//                                                       child: Column(
//                                                         children: [
//                                                           Container(
//                                                             decoration: BoxDecoration(
//                                                               color: large == true
//                                                                   ? AppColors.buttonsColor
//                                                                   : Color.fromRGBO(10, 8, 100, 1),
//                                                               borderRadius:
//                                                               BorderRadius.circular(15),
//                                                             ),
//                                                             child: SizedBox(
//                                                                 height: 80,
//                                                                 width: 80,
//                                                                 child: Image.asset(
//                                                                     './assets/images/largeman.png')),
//                                                           ),
//                                                           large == true
//                                                               ? Text('Large')
//                                                               : Text(''),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     InkWell(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           small = false;
//                                                           medioum = false;
//                                                           large = false;
//                                                           xl = true;
//                                                           cartonSize = 'XL';
//                                                         });
//                                                         print('extra large');
//                                                       },
//                                                       child: Column(
//                                                         children: [
//                                                           Container(
//                                                             decoration: BoxDecoration(
//                                                               color: xl == true
//                                                                   ? AppColors.buttonsColor
//                                                                   : Color.fromRGBO(10, 8, 100, 1),
//                                                               borderRadius:
//                                                               BorderRadius.circular(15),
//                                                             ),
//                                                             child: SizedBox(
//                                                                 height: 80,
//                                                                 width: 80,
//                                                                 child: Image.asset(
//                                                                     './assets/images/extralarge man.png')),
//                                                           ),
//                                                           xl == true ? Text('X Large') : Text(''),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ):Container(),
//                                               SizedBox(height: 2.h,),
//                                               bag_or_sack_selected == true ?
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left: 20,right: 20.0),
//                                                 child: Column(
//                                                   children: [
//                                                     Container(
//                                                       decoration:BoxDecoration(
//                                                           borderRadius: BorderRadius.circular(100),
//                                                           border: Border.all(width: 1,color: AppColors.buttonsColor,)),
//                                                       child: Row(
//                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                         children: [
//                                                           InkWell(
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 small == false
//                                                                     ? small = true
//                                                                     : small = false;
//                                                                 medioum = false;
//                                                                 large = false;
//                                                                 bagorsackSize = 'S';
//                                                                 print('$bagorsackSize' + ' selcted');
//                                                               });
//                                                             },
//                                                             child: Container(
//                                                               width: 100,
//                                                               decoration: BoxDecoration(
//                                                                   color: small == false
//                                                                       ? Colors.white
//                                                                       : AppColors.buttonsColor,
//                                                                   borderRadius: BorderRadius.only(
//                                                                       topLeft: Radius.circular(25),
//                                                                       bottomLeft:
//                                                                       Radius.circular(25))),
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.all(8.0),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     'Small',
//                                                                     style: TextStyle(
//                                                                       fontFamily: 'ArgentumSans',
//                                                                       color: small == false
//                                                                           ? AppColors.buttonsColor
//                                                                           : Colors.black,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 medioum == false
//                                                                     ? medioum = true
//                                                                     : medioum = false;
//                                                                 small = false;
//                                                                 large = false;
//                                                                 bagorsackSize = 'M';
//                                                                 print('$bagorsackSize' + ' selected');
//                                                               });
//                                                             },
//                                                             child: Container(
//                                                               width: 100,
//                                                               decoration: BoxDecoration(
//                                                                 color: medioum == false
//                                                                     ? Colors.white
//                                                                     : AppColors.buttonsColor,
//                                                               ),
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.all(8.0),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     'Medium',
//                                                                     style: TextStyle(
//                                                                       fontFamily: 'ArgentumSans',
//                                                                       color: medioum == false
//                                                                           ? AppColors.buttonsColor
//                                                                           : Colors.black,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           InkWell(
//                                                             onTap: () {
//                                                               setState(() {
//                                                                 large == true
//                                                                     ? large = false
//                                                                     : large = true;
//                                                                 small = false;
//                                                                 medioum = false;
//                                                                 bagorsackSize = 'L';
//                                                                 print('$bagorsackSize+ selected');
//                                                               });
//                                                             },
//                                                             child: Container(
//                                                               width: 100,
//                                                               decoration: BoxDecoration(
//                                                                   color: large == false
//                                                                       ? Colors.white
//                                                                       : AppColors.buttonsColor,
//                                                                   borderRadius: BorderRadius.only(
//                                                                       topRight: Radius.circular(25),
//                                                                       bottomRight:
//                                                                       Radius.circular(25))),
//                                                               child: Padding(
//                                                                 padding: const EdgeInsets.all(8.0),
//                                                                 child: Center(
//                                                                   child: Text(
//                                                                     'Large',
//                                                                     style: TextStyle(
//                                                                         fontFamily: 'ArgentumSans',
//                                                                         color: large == false
//                                                                             ? AppColors.buttonsColor
//                                                                             : Colors.black),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 2.h,),
//                                                     Row(
//                                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                       children: [
//                                                         SizedBox(
//                                                           height:100,
//                                                           child: Image.asset(
//                                                               './assets/images/sack.png'),
//                                                         ),
//                                                         Text(bagorsackSize=='S'?'10 kg':
//                                                         bagorsackSize=='M'?'25 kg':
//                                                         bagorsackSize=='L'?'50 kg':""
//                                                           , style: TextStyle(
//                                                             fontSize: 22,
//                                                             color: AppColors.buttonsColor,
//                                                             fontWeight: FontWeight.bold,
//                                                           ),
//                                                         )
//
//                                                       ],)
//                                                   ],
//                                                 ),
//                                               ):Container(),
//                                               others_selected == true?
//                                               Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                                 children: [
//                                                   Column(
//                                                     children: [
//                                                       Text('Height',style: TextStyle(
//                                                         color: Colors.black54,
//                                                       ),),
//                                                       SizedBox(height: 1.h,),
//                                                       Container(
//                                                         width: 100,
//                                                         height: 30,
//                                                         decoration: BoxDecoration(
//                                                           border: Border.all(width: 1,color: AppColors.buttonsColor),
//                                                           borderRadius: BorderRadius.circular(100),
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                                                           child: TextFormField(
//                                                             controller: height,
//                                                             focusNode: heightNode,
//                                                             onFieldSubmitted: (val){
//                                                               Utils.fieldFocusChange(context, heightNode, widthNode);
//                                                             },
//                                                             keyboardType: TextInputType.number,
//                                                             textAlign: TextAlign.right,
//                                                             decoration: InputDecoration(
//                                                               border: InputBorder.none,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     children: [
//                                                       Text('Width',style: TextStyle(
//                                                         color: Colors.black54,
//                                                       ),),
//                                                       SizedBox(height: 1.h,),
//                                                       Container(
//                                                         width: 100,
//                                                         height: 30,
//                                                         decoration: BoxDecoration(
//                                                           border: Border.all(width: 1,color: AppColors.buttonsColor),
//                                                           borderRadius: BorderRadius.circular(100),
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                                                           child: TextFormField(
//                                                             controller: width,
//                                                             focusNode: widthNode,
//                                                             onFieldSubmitted: (val){
//                                                               Utils.fieldFocusChange(context, widthNode, lengthNode);
//                                                             },
//                                                             keyboardType: TextInputType.number,
//                                                             textAlign: TextAlign.right,
//                                                             decoration: InputDecoration(
//                                                               border: InputBorder.none,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                   Column(
//                                                     children: [
//                                                       Text('Length',style: TextStyle(
//                                                         color: Colors.black54,
//                                                       ),),
//                                                       SizedBox(height: 1.h,),
//                                                       Container(
//                                                         width: 100,
//                                                         height: 30,
//                                                         decoration: BoxDecoration(
//                                                           border: Border.all(width: 1,color: AppColors.buttonsColor),
//                                                           borderRadius: BorderRadius.circular(100),
//                                                         ),
//                                                         child: Padding(
//                                                           padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                                                           child: TextFormField(
//                                                             controller: length,
//                                                             focusNode: lengthNode,
//                                                             onFieldSubmitted: (val){
//                                                               Utils.fieldFocusChange(context, lengthNode, countNode);
//                                                             },
//                                                             keyboardType: TextInputType.number,
//                                                             textAlign: TextAlign.right,
//                                                             decoration: InputDecoration(
//                                                               border: InputBorder.none,
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       )
//                                                     ],
//                                                   ),
//                                                 ],
//                                               ):Container(),
//                                               SizedBox(height: 1.h,),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     Column(
//                                                       children: [
//                                                         Text('Count',style: TextStyle(
//                                                           color: Colors.black54,
//                                                         ),),
//                                                         SizedBox(height: 1.h,),
//                                                         Container(
//                                                           width: 120,
//                                                           height: 30,
//                                                           decoration: BoxDecoration(
//                                                             border: Border.all(width: 1,color: AppColors.buttonsColor),
//                                                             borderRadius: BorderRadius.circular(100),
//                                                           ),
//                                                           child: Padding(
//                                                             padding: const EdgeInsets.only(left: 10.0,right: 10.0),
//                                                             child: TextFormField(
//                                                               controller: count,
//                                                               focusNode: countNode,
//                                                               onFieldSubmitted: (value) {
//                                                                 Utils.fieldFocusChange(context, countNode, lengthNode);
//                                                               },
//                                                               keyboardType: TextInputType.number,
//                                                               textAlign: TextAlign.right,
//                                                               decoration: InputDecoration(
//                                                                 border: InputBorder.none,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         )
//                                                       ],
//                                                     ),
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(top: 20.0),
//                                                       child: Text("Price: ₹${100000}",
//                                                           style: TextStyle(
//                                                             fontSize: 16.sp,
//                                                             fontWeight: FontWeight.w700,
//                                                           )),
//                                                     ),
//                                                   ],),
//                                               ),
//
//                                               SizedBox(height: 2.h,),
//                                             ],
//                                           ),
//                                         ),
//
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             InkWell(
//                                               onTap: (){
//
//                                               },
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.red,
//                                                     borderRadius: BorderRadius.circular(100)
//                                                 ),
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
//                                                   child: Text('Delete',style: TextStyle(color: Colors.white),),
//                                                 ),
//                                               ),
//                                             ),
//                                             InkWell(
//                                               onTap: (){
//
//                                               },
//                                               child: Container(
//                                                 decoration: BoxDecoration(
//                                                     color: Colors.green,
//                                                     borderRadius: BorderRadius.circular(100)
//                                                 ),
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
//                                                   child: Row(
//                                                     children: [
//                                                       Icon(Icons.add,color: Colors.white,),
//                                                       Text('Add Item',style: TextStyle(
//                                                           color: Colors.white
//                                                       ),),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             )
//                                           ],
//                                         )
//                                       ],
//                                     ),
//                                   );
//                                 }
//                               ),
//                             ),
//                             SizedBox(height: 2.h),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 InkWell(
//                                   onTap: (){
//
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       color: Colors.red,
//                                       borderRadius: BorderRadius.circular(100)
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
//                                       child: Text('Delete',style: TextStyle(color: Colors.white),),
//                                     ),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: (){
//
//                                   },
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                         color: Colors.green,
//                                         borderRadius: BorderRadius.circular(100)
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
//                                       child: Text('Destination',style: TextStyle(
//                                         color: Colors.white
//                                       ),),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                       );
//                     }
//                   ),
//                 )
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/app_colors.dart';
import '../res/components/Booking Screen Components/custom_dropdown.dart';
import '../utils/utils.dart';

class BookingPage222 extends StatefulWidget {
  const BookingPage222({Key? key}) : super(key: key);

  @override
  State<BookingPage222> createState() => _BookingPage222State();
}

class _BookingPage222State extends State<BookingPage222> {
  String? dropSelected1 = 'Pick a location';
  String? dropSelected2;
  String? dropSelected3;


  bool carton_selected = false;
  bool bag_or_sack_selected = false;
  bool others_selected = false;
  String? typeSelected = '';

  bool small = false;
  bool medioum = false;
  bool large = false;
  bool xl = false;
  String? sizeSelected = '';

  String? type = 'carton';
  String size = 'small';
  String? cartonSize;
  String? bagorsackSize;
  String? other;

  TextEditingController count = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController p_details = TextEditingController();

  FocusNode countNode = FocusNode();
  FocusNode lengthNode = FocusNode();
  FocusNode widthNode = FocusNode();
  FocusNode heightNode = FocusNode();
  FocusNode weightNode = FocusNode();
  FocusNode p_Node = FocusNode();

  List<int> Countofwidget = [0];
  List<int> Countof2widget = [0];
  int? selectedslide;

  bool location1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Shipment Details',
                        style: TextStyle(
                          color: AppColors.buttonsColor,
                          fontSize: 22,
                          fontFamily: 'ArgentumSans',
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_outlined,
                        color: AppColors.buttonsColor,
                        size: 50,
                      )
                    ],
                  ),
            ),
              SizedBox(
                height: 580,
                child: ListView.builder(
                  itemCount: Countofwidget.length,
                  itemBuilder: (context,index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1,color: AppColors.buttonsColor)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    location1 == true? location1 = false : location1 = true;
                                  });
                                  },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(dropSelected1.toString(),style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.buttonsColor,
                                      ),),
                                      location1 == true ?Icon(Icons.arrow_drop_up):Icon(Icons.arrow_drop_down_outlined),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            location1 == true? Container(
                              color: Colors.blue[50],
                              child: Column(
                                children: [
                                  Text(
                                    'Drop Location',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(25),
                                          border:
                                          Border.all(width: 1, color: AppColors.buttonsColor)),
                                      child: CustomDropdown(
                                        options: ['one', 'two', 'three'],
                                        hintText: 'Select address',
                                        onChanged: (values) {
                                          setState(() {
                                            dropSelected1 = values;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 410,
                                    child: ListView.builder(
                                      itemCount:Countof2widget.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context,index) {
                                        return Container(
                                          color:Colors.white,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 1.h,),
                                              Center(
                                                child: CircleAvatar(
                                                  child: Text('${index + 1}'.toString(),style: TextStyle(color: Colors.white),),
                                                  backgroundColor: AppColors.buttonsColor,
                                                maxRadius: 10),
                                              ),
                                              Text(
                                                'Product Details',
                                                style: TextStyle(color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10, right: 10),
                                                child: Container(
                                                  height:40,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1, color: AppColors.buttonsColor),
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(left: 10.0,bottom:5.0),
                                                    child: TextFormField(
                                                      controller: p_details,
                                                      focusNode: p_Node,
                                                      onFieldSubmitted: (value) {
                                                        Utils.fieldFocusChange(context, p_Node, countNode);
                                                      },
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,),
                                                      // Other TextField properties...
                                                    ),

                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 1.h,),
                                              Text(
                                                'Type',
                                                style: TextStyle(
                                                  fontFamily: "ArgentumSans",
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              SizedBox(height: 1.h,),

                                              Padding(
                                                padding: const EdgeInsets.only(left: 20, right: 20),
                                                child: Container(
                                                  // width: MediaQuery.of(context).size.width,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(width: 1, color: AppColors.buttonsColor),
                                                    borderRadius: BorderRadius.circular(25),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            carton_selected == false
                                                                ? carton_selected = true
                                                                : carton_selected = false;
                                                            bag_or_sack_selected = false;
                                                            others_selected = false;
                                                            type = 'carton';
                                                            print('$type' + 'selected');
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color: carton_selected == false
                                                                  ? Colors.white
                                                                  : AppColors.buttonsColor,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius.circular(25),
                                                                  bottomLeft: Radius.circular(25))),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Center(
                                                              child: Text(
                                                                'Carton',
                                                                style: TextStyle(
                                                                  fontFamily: 'ArgentumSans',
                                                                  color: carton_selected == false
                                                                      ? AppColors.buttonsColor
                                                                      : Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            bag_or_sack_selected == false
                                                                ? bag_or_sack_selected = true
                                                                : bag_or_sack_selected = false;
                                                            carton_selected = false;
                                                            others_selected = false;
                                                            type = 'bag/sack';
                                                            print('$type' + 'selected');
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                            color: bag_or_sack_selected == false
                                                                ? Colors.white
                                                                : AppColors.buttonsColor,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Center(
                                                              child: Text(
                                                                'Bag/Sack',
                                                                style: TextStyle(
                                                                  fontFamily: 'ArgentumSans',
                                                                  color: bag_or_sack_selected == false
                                                                      ? AppColors.buttonsColor
                                                                      : Colors.black,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            others_selected == true
                                                                ? others_selected = false
                                                                : others_selected = true;
                                                            carton_selected = false;
                                                            bag_or_sack_selected = false;
                                                            type = 'others';
                                                            print('$type' + 'Selected');
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                              color: others_selected == false
                                                                  ? Colors.white
                                                                  : AppColors.buttonsColor,
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(25),
                                                                  bottomRight: Radius.circular(25))),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Center(
                                                              child: Text(
                                                                'Others',
                                                                style: TextStyle(
                                                                    fontFamily: 'ArgentumSans',
                                                                    color: others_selected == false
                                                                        ? AppColors.buttonsColor
                                                                        : Colors.black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 1.h,),
                                              carton_selected ==   true ?
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          small = true;
                                                          medioum = false;
                                                          large = false;
                                                          xl = false;
                                                          cartonSize='S';
                                                        });
                                                        print('small selected');
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: small == true
                                                                  ? AppColors.buttonsColor
                                                                  : Color.fromRGBO(10, 8, 100, 1),
                                                              borderRadius:
                                                              BorderRadius.circular(15),
                                                            ),
                                                            child: SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: Image.asset(
                                                                    './assets/images/smallman.png')),
                                                          ),
                                                          small == true
                                                              ? Text(
                                                            'SMALL',
                                                          )
                                                              : Text(''),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          small = false;
                                                          medioum = true;
                                                          large = false;
                                                          xl = false;
                                                          cartonSize = 'M';
                                                        });

                                                        print('Medium selected');
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: medioum == true
                                                                  ? AppColors.buttonsColor
                                                                  : Color.fromRGBO(10, 8, 100, 1),
                                                              borderRadius:
                                                              BorderRadius.circular(15),
                                                            ),
                                                            child: SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: Image.asset(
                                                                    './assets/images/mediumman.png')),
                                                          ),
                                                          medioum == true
                                                              ? Text('Medium')
                                                              : Text(''),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                       setState(() {

                                                       });(() {
                                                          small = false;
                                                          medioum = false;
                                                          large = true;
                                                          xl = false;
                                                          cartonSize = 'L';
                                                        });

                                                        print('Large selected');
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: large == true
                                                                  ? AppColors.buttonsColor
                                                                  : Color.fromRGBO(10, 8, 100, 1),
                                                              borderRadius:
                                                              BorderRadius.circular(15),
                                                            ),
                                                            child: SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: Image.asset(
                                                                    './assets/images/largeman.png')),
                                                          ),
                                                          large == true
                                                              ? Text('Large')
                                                              : Text(''),
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          small = false;
                                                          medioum = false;
                                                          large = false;
                                                          xl = true;
                                                          cartonSize = 'XL';
                                                        });
                                                        print('extra large');
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            decoration: BoxDecoration(
                                                              color: xl == true
                                                                  ? AppColors.buttonsColor
                                                                  : Color.fromRGBO(10, 8, 100, 1),
                                                              borderRadius:
                                                              BorderRadius.circular(15),
                                                            ),
                                                            child: SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: Image.asset(
                                                                    './assets/images/extralarge man.png')),
                                                          ),
                                                          xl == true ? Text('X Large') : Text(''),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ):Container(),
                                              SizedBox(height: 2.h,),
                                              bag_or_sack_selected == true ?
                                              Padding(
                                                padding: const EdgeInsets.only(left: 20,right: 20.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(100),
                                                          border: Border.all(width: 1,color: AppColors.buttonsColor,)),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                small == false
                                                                    ? small = true
                                                                    : small = false;
                                                                medioum = false;
                                                                large = false;
                                                                bagorsackSize = 'S';
                                                                print('$bagorsackSize' + ' selcted');
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: small == false
                                                                      ? Colors.white
                                                                      : AppColors.buttonsColor,
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(25),
                                                                      bottomLeft:
                                                                      Radius.circular(25))),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Small',
                                                                    style: TextStyle(
                                                                      fontFamily: 'ArgentumSans',
                                                                      color: small == false
                                                                          ? AppColors.buttonsColor
                                                                          : Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                medioum == false
                                                                    ? medioum = true
                                                                    : medioum = false;
                                                                small = false;
                                                                large = false;
                                                                bagorsackSize = 'M';
                                                                print('$bagorsackSize' + ' selected');
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                color: medioum == false
                                                                    ? Colors.white
                                                                    : AppColors.buttonsColor,
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Medium',
                                                                    style: TextStyle(
                                                                      fontFamily: 'ArgentumSans',
                                                                      color: medioum == false
                                                                          ? AppColors.buttonsColor
                                                                          : Colors.black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                large == true
                                                                    ? large = false
                                                                    : large = true;
                                                                small = false;
                                                                medioum = false;
                                                                bagorsackSize = 'L';
                                                                print('$bagorsackSize+ selected');
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              decoration: BoxDecoration(
                                                                  color: large == false
                                                                      ? Colors.white
                                                                      : AppColors.buttonsColor,
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight: Radius.circular(25),
                                                                      bottomRight:
                                                                      Radius.circular(25))),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Center(
                                                                  child: Text(
                                                                    'Large',
                                                                    style: TextStyle(
                                                                        fontFamily: 'ArgentumSans',
                                                                        color: large == false
                                                                            ? AppColors.buttonsColor
                                                                            : Colors.black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 2.h,),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                      children: [
                                                        SizedBox(
                                                          height:100,
                                                          child: Image.asset(
                                                              './assets/images/sack.png'),
                                                        ),
                                                        Text(bagorsackSize=='S'?'10 kg':
                                                        bagorsackSize=='M'?'25 kg':
                                                        bagorsackSize=='L'?'50 kg':""
                                                          , style: TextStyle(
                                                            fontSize: 22,
                                                            color: AppColors.buttonsColor,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        )

                                                      ],)
                                                  ],
                                                ),
                                              ):Container(),
                                              others_selected == true?
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text('Height',style: TextStyle(
                                                        color: Colors.black54,
                                                      ),),
                                                      SizedBox(height: 1.h,),
                                                      Container(
                                                        width: 100,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 1,color: AppColors.buttonsColor),
                                                          borderRadius: BorderRadius.circular(100),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                                          child: TextFormField(
                                                            controller: height,
                                                            focusNode: heightNode,
                                                            onFieldSubmitted: (val){
                                                              Utils.fieldFocusChange(context, heightNode, widthNode);
                                                            },
                                                            keyboardType: TextInputType.number,
                                                            textAlign: TextAlign.right,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text('Width',style: TextStyle(
                                                        color: Colors.black54,
                                                      ),),
                                                      SizedBox(height: 1.h,),
                                                      Container(
                                                        width: 100,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 1,color: AppColors.buttonsColor),
                                                          borderRadius: BorderRadius.circular(100),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                                          child: TextFormField(
                                                            controller: width,
                                                            focusNode: widthNode,
                                                            onFieldSubmitted: (val){
                                                              Utils.fieldFocusChange(context, widthNode, lengthNode);
                                                            },
                                                            keyboardType: TextInputType.number,
                                                            textAlign: TextAlign.right,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text('Length',style: TextStyle(
                                                        color: Colors.black54,
                                                      ),),
                                                      SizedBox(height: 1.h,),
                                                      Container(
                                                        width: 100,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 1,color: AppColors.buttonsColor),
                                                          borderRadius: BorderRadius.circular(100),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                                          child: TextFormField(
                                                            controller: length,
                                                            focusNode: lengthNode,
                                                            onFieldSubmitted: (val){
                                                              Utils.fieldFocusChange(context, lengthNode, countNode);
                                                            },
                                                            keyboardType: TextInputType.number,
                                                            textAlign: TextAlign.right,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  SizedBox(height: 1.h,),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        decoration:BoxDecoration(
                                                      color:Colors.red,
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                        child: Text('Delete',style: TextStyle(
                                                          color: Colors.white,
                                                        ),),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ):Container(),
                                              SizedBox(height: 1.h,),
                                              Padding(
                                                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text('Count',style: TextStyle(
                                                          color: Colors.black54,
                                                        ),),
                                                        SizedBox(height: 1.h,),
                                                        Container(
                                                          width: 120,
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(width: 1,color: AppColors.buttonsColor),
                                                            borderRadius: BorderRadius.circular(100),
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                                            child: TextFormField(
                                                              controller: count,
                                                              focusNode: countNode,
                                                              onFieldSubmitted: (value) {
                                                                Utils.fieldFocusChange(context, countNode, lengthNode);
                                                              },
                                                              keyboardType: TextInputType.number,
                                                              textAlign: TextAlign.right,
                                                              decoration: InputDecoration(
                                                                border: InputBorder.none,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 20.0),
                                                      child: Text("Price: ₹${100000}",
                                                          style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight: FontWeight.w700,
                                                          )),
                                                    ),
                                                  ],),
                                              ),
                                              SizedBox(height: 1.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  if(Countof2widget.length>1)
                                                   InkWell(
                                                     onTap:(){
                                                       setState(() {
                                                         Countof2widget.removeAt(index);
                                                       });
                                                     },
                                                     child: Container(
                                                      decoration:BoxDecoration(
                                                        color: Colors.red,
                                                        borderRadius: BorderRadius.circular(100)
                                                      ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Text('Delete',style: TextStyle(
                                                            color: Colors.white
                                                          ),),
                                                        )),
                                                   ),
                                                  InkWell(
                                                    onTap: (){
                                                      setState(() {
                                                        if(Countof2widget.length>5){
                                                          return;
                                                        }
                                                        Countof2widget.add(index);
                                                      });
                                                    },
                                                    child: Container(
                                                        decoration:BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius: BorderRadius.circular(100)
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Text('Add More',style: TextStyle(
                                                              color: Colors.white
                                                          ),),
                                                        )),
                                                  ),

                                                ],
                                              ),

                                              SizedBox(height: 1.h,),
                                              Divider(
                                                height: 1,
                                                color: AppColors.buttonsColor,
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                    ),
                                  ),
                                  SizedBox(height: 1.h,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      if(Countofwidget.length>1)
                                        InkWell(
                                          onTap:(){
                                            setState(() {
                                              Countofwidget.removeAt(index);
                                            });
                                          },
                                          child: Container(
                                              decoration:BoxDecoration(
                                                  color: AppColors.buttonsColor,
                                                  borderRadius: BorderRadius.circular(100)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Text('Delete',style: TextStyle(
                                                    color: Colors.black,
                                                  fontWeight: FontWeight.bold
                                                ),),
                                              )),
                                        ),
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            if(Countofwidget.length>5){
                                              return;
                                            }
                                            Countofwidget.add(index);
                                          });
                                        },
                                        child: Container(
                                            decoration:BoxDecoration(
                                                color: AppColors.buttonsColor,
                                                borderRadius: BorderRadius.circular(100)
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Text('Add More',style: TextStyle(
                                                  color: Colors.black,
                                                fontWeight: FontWeight.bold
                                              ),),
                                            )),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 1.h,),

                                ],
                              ),
                            ):Container(),

                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(height: 1.h,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.buttonsColor,
                    borderRadius: BorderRadius.circular(100)
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Calculate Price',style: TextStyle(
                        color: Colors.white
                      ),),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
