import 'dart:convert';
import 'package:chaavie_customer/views/booking/booking_page1.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/app_colors.dart';
import '../utils/utils.dart';


var valueunitmain;
var valueUnitSize ='cm';
var valueUnit ='kg';
var total;
int chargeableWeight=100;
var totalPrice;
var totalVolume;
var totalVolume1;
double totalWeight=0.000;
var bookingAdvance;
double finalWeight=0;
double finalVolume=0;
final weightControl = TextEditingController();
final countControl = TextEditingController();
final length = TextEditingController();
final breadth = TextEditingController();
final height = TextEditingController();
final ProductDetail = TextEditingController();

String? selecttyped = 'Carton';
String? selectUnit = 'cm';
String? selectUnitWeight = 'kg';
TextEditingController product = TextEditingController();

double totalVolumeC=0.00;
double vol1=0;
TextStyle? styles= const TextStyle(fontSize: 13,
    fontFamily: 'ArgentumSans',fontWeight: FontWeight.w500,
    color:Colors.black38);
List<DynamicWidget> listDynamic =[new DynamicWidget()];
List<String> finalVolumeList= <String>[];
List<String> finalWeightList= <String>[];

void didChangeDependencies() {
  finalVolume;
  finalWeight;
}
submitbutton(){
  print("length${finalVolumeList.length}");
  finalVolumeList.clear();
  finalWeightList.clear();
  listDynamic.forEach((widget)=> finalVolumeList.add(widget.weightControl2.text));
  listDynamic.forEach((widget)=> finalWeightList.add(widget.newproduct.text));
  print("list:${finalVolumeList.length}");
  print("list:${finalWeightList}");

}
finalTotal(){
  submitbutton();
  finalVolume=0;
  for (var items in finalVolumeList){
    print("items${items.length}");
    if(items.length!=0) {
      double items1 = double.parse(items);
      print(items1);
      finalVolume += items1;
      print(finalVolume);
    }
  }
  finalWeight=0;
  for(var Items in finalWeightList){
    if(Items.length!=0) {
      double items1 = double.parse(Items);
      finalWeight += items1;
      print(finalWeight);
    }
  }
  finalWeightList.clear();
  finalVolumeList.clear();
  didChangeDependencies();
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override

  final _formKey = GlobalKey<FormState>();
  // List<int> sumoftotalint = sumoftotal.map(int.parse).toList();
  bool isLoading = false;
  addDynamic(){
    if(listDynamic.length>=5){
      return;
    }
    listDynamic.add(DynamicWidget());
    setState(() {

    });
  }

  initState() {
    product = TextEditingController();
    super.initState();
  }
  void dispose (){
    product.dispose();
  }


  var volumeTotal;
  var weightTotal;
  double vol = 0;
  final ScrollController scrollController = ScrollController();
  CarouselController controller = CarouselController();
  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30,),
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
                  SizedBox(height: 2.h,),
                  SizedBox(
                    // height: MediaQuery.of(context).size.height*0.6,
                    // width: MediaQuery.of(context).size.width,
                    child: CarouselSlider.builder(
                        carouselController: controller,
                        itemCount: listDynamic.length,
                        itemBuilder: (context, index,realIndex){
                          return Column(
                            children: [
                              if(listDynamic.length>1)
                                CircleAvatar(backgroundColor: Color(0xfff05acff),
                                  child: Text("${index+1}",
                                    style: TextStyle(fontSize: 14,
                                        color: Colors.white),),
                                  radius: 11,),
                              if(index==0)
                                // Padding(
                                //   padding: const EdgeInsets.only(bottom: 10,top: 10),
                                //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                //     children: [
                                //     ],
                                //   ),
                                // ),
                              listDynamic[index],
                              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  if(listDynamic.length>1)
                                    ElevatedButton(
                                      onPressed:  () {
                                        setState(() {
                                          if(listDynamic.length>1) {
                                            listDynamic.removeAt(index);
                                            finalTotal();
                                          }
                                        });
                                      },
                                      child:
                                      Container(
                                        width: 250,
                                        height: 100,
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'remove',
                                                style: TextStyle(fontFamily: 'ArgentumSans',
                                                  fontSize: 14,),
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(130, 30),
                                          maximumSize: const Size(130, 30),
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20))

                                      ),
                                    ),
                                  ElevatedButton(
                                    onPressed:  () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey;
                                        addDynamic();
                                        controller.nextPage(
                                            duration: const Duration(milliseconds: 10), curve:   Curves.linear);
                                        isLoading = true;

                                      }
                                    },
                                    child:
                                    Container(
                                      width: 250,
                                      height: 100,
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.add,size: 18),
                                            Text(
                                              'add more',
                                              style: TextStyle(fontFamily: 'ArgentumSans',
                                                fontSize: 14,),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(130, 30),
                                        maximumSize: const Size(130, 30),
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20))

                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: listDynamic.map((url) {
                                  int index = listDynamic.indexOf(url);
                                  return InkWell(
                                    onTap: () {
                                      controller.animateToPage(index,
                                          duration: const Duration(milliseconds: 10), curve:   Curves.linear);
                                    },
                                    child: Container(
                                      width: 15.0,
                                      height: 15.0,
                                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentPos == index
                                            ? Color(0xfff05acff)
                                            : Color.fromRGBO(0, 0, 0, 0.4),
                                      ),
                                      // child: Center(
                                      //   child: Text('${index + 1}',
                                      //   style: TextStyle(fontSize: 10)),),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          );
                        },
                        options: CarouselOptions(
                          onPageChanged: (val, _) {
                            setState(() {
                              currentPos = val;
                              controller.jumpToPage(val);
                            });
                          },
                          scrollPhysics: AlwaysScrollableScrollPhysics(),
                          height: MediaQuery.of(context).size.height*0.9,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: false,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 1.0,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void weight() {
    double w = double.parse(
        weightControl.text == null ? '0' : weightControl.text);
    double c = double.parse(
        countControl.text == null ? '0' : countControl.text);
    totalWeight = c * w;
    print(totalWeight);
  }

  void volume() {
    double h = double.parse(height.text == null ? '0' : height.text.toString());
    double c = double.parse(countControl.text == null ? '0' : countControl.text);
    if (selecttyped == 'Sack') {
      double l = double.parse(length.text == null ? '0' : length.text.toString());
      // double b = (l / 2);
      // print("width$b");
      if(l>=h){
        if (selectUnit == 'cm') {
          vol = l * (l / 2) * h * (0.01 * 0.01 * 0.01);
          totalVolumeC = vol * c;
          print("totalvol:$totalVolumeC");
          vol1 = l * (l / 2) * h * 100;
          print(vol);
        }
        else if (selectUnit == 'in') {
          vol = l * (l / 2) * h * (0.0254 * 0.0254 * 0.0254);
          totalVolumeC = vol * c;
          print(vol);
        }
        else {
          vol = l * (l / 2) * h * (0.3048 * 0.3048 * 0.3048);
          totalVolumeC = vol * c;
          print(vol);
        }
      }
      else{
        if (selectUnit == 'cm') {
          vol = l * (h / 2) * h * (0.01 * 0.01 * 0.01);
          totalVolumeC = vol * c;
          print("totalvol:$totalVolumeC");
          vol1 = l * (h / 2) * h * 100;
          print(vol);
        }
        else if (selectUnit == 'in') {
          vol = l * (h / 2) * h * (0.0254 * 0.0254 * 0.0254);
          totalVolumeC = vol * c;
          print(vol);
        }
        else {
          vol = l * (h / 2) * h * (0.3048 * 0.3048 * 0.3048);
          totalVolumeC = vol * c;
          print(vol);
        }
      }
    }
    else if(selecttyped == 'Carton'||selecttyped == 'Crate'){
      double w = double.parse(breadth.text == null ? '0' : breadth.text.toString());
      double l = double.parse(length.text == null ? '0' : length.text.toString());
      if (selectUnit == 'cm') {
        vol = l * w * h * (0.01 * 0.01 * 0.01);
        totalVolumeC = vol * c;
        print(vol);
      }
      else if (selectUnit == 'in') {
        vol = l * w * h * (0.0254 * 0.0254 * 0.0254);
        totalVolumeC = vol * c;
        print(vol);
      }
      else {
        vol = l * w * h * (0.3048 * 0.3048 * 0.3048);
        totalVolumeC = vol * c;
        print(vol);
      }
    }
    else {
      print('roll');
      double d = double.parse(length.text == null ? '0' : length.text.toString());
      if (selectUnit == 'cm') {
        vol = d * d * h * (0.01 * 0.01 * 0.01);
        totalVolumeC = vol * c;
        print("totalvol:$totalVolumeC");
        print(vol);
      }
      else if (selectUnit == 'in') {
        vol = d * d * h * (0.0254 * 0.0254 * 0.0254);
        totalVolumeC = vol * c;
        print(vol);
      }
      else {
        vol = d * d * h *  (0.3048 * 0.3048 * 0.3048);
        totalVolumeC = vol * c;
        print(vol);
      }
    }
    // totalVolume1 = l*w*h;
  }

  /////////////////////////////////////////////////////////////////////////////// API

  showAlertDialog(BuildContext context) {
    Widget cancelButton = ElevatedButton(
        child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: const Text(
            'Place Order',
            style: const TextStyle(
              fontSize: 15,),
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfff05acff),
            minimumSize: const Size(120, 40),
            maximumSize: const Size(120, 40),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40))),
        onPressed:(){
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => FinalPage(),));

          void resetButtonClicked() {
            setState(() {
              // clear other variables
            });
          }
          resetButtonClicked();
        }
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height*0.45,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.blue[50],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow:[
            BoxShadow(
              blurRadius: 20,
              color: Colors.blue.shade100,
            ) ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              const Text(
                "Total Price",
                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38),
              ),
              const SizedBox(height: 5,),
              totalPrice==null? const CircularProgressIndicator() :
              // Text("₹${totalPrice==null? '0':totalPrice.toStringAsFixed(0)}"
              Text('7460'
                  ,style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10,),
              Text('Please note that this amount is based on the inputs provided during the booking process, '
                  'it might be revised in case of significant variations',
                  textAlign: TextAlign.center,
                  style: styles
                // TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 14)
              )
              ,const SizedBox(height: 20,)
              , const Text('Booking Advance',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black38)),
              const SizedBox(height: 5,),
              bookingAdvance==null? const CircularProgressIndicator() :
              // Text("₹${bookingAdvance.toStringAsFixed(0)}",
              Text('1500',
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.blue)),
              const SizedBox(height: 10,),
              Text('This is non-refundable, however can be adjusted in case of date changes',
                  textAlign: TextAlign.center,
                  style: styles
                // TextStyle(fontWeight: FontWeight.bold,color: Colors.black38,fontSize: 14)
              ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cancelButton,
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
class Textfield extends StatelessWidget {
  var controller;
  var suffix;
  var onChanged;
  Textfield({Key? key,required this.controller,this.suffix,this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: const TextStyle(color: Colors.grey,
        fontSize: 15,
        fontFamily: 'ArgentumSans',
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      maxLines: 1,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(
            10, 10, 10, 0),
        suffix: suffix,
        suffixStyle: const TextStyle(
          fontSize: 12,color: Colors.grey,fontFamily: 'ArgentumSans',),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.blue),
          borderRadius: BorderRadius.circular(30),
        ),
        focusColor: Colors.blue,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.blue),
            borderRadius: BorderRadius.circular(
                30)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                30),
            borderSide: const BorderSide(
              color: Colors.blue,
            )),
      ),
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Value Can\'t Be Empty';
        }
        return null;
      },
    );
  }
}

class DynamicWidget extends StatelessWidget{

  TextEditingController productDetail = TextEditingController();
  TextEditingController count = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();

  FocusNode countNode = FocusNode();
  FocusNode lengthNode = FocusNode();
  FocusNode widthNode = FocusNode();
  FocusNode heightNode = FocusNode();
  FocusNode weightNode = FocusNode();
  FocusNode productNode = FocusNode();

  String type = 'Carton';
  String cartonSize = 'S';
  String bagorsackSize = 'S';


  bool carton_selected = true;
  bool bag_or_sack_selected = false;
  bool others_selected = false;

  bool small = false;
  bool medioum = false;
  bool large = false;
  bool xl = false;

  final weightControl2 = TextEditingController();
  final weightControl1 = TextEditingController();
  final countControl1 = TextEditingController();
  final length1 = TextEditingController();
  final breadth1 = TextEditingController();
  final height1 = TextEditingController();
  final ProductDetail = TextEditingController();

  TextEditingController newproduct = TextEditingController();
  String? selecTtyped = 'Carton';
  String? selectUnitWeight = 'kg';

  int currentStep = 0;
  var valueUnit1;
  var test;
  double height2 = 30;
  Color? color1 = const Color(0xfff05acff);
  TextStyle? styles = const TextStyle(fontSize: 13,
      fontFamily: 'ArgentumSans', fontWeight: FontWeight.w500,
      color: Colors.black38);
  TextStyle? styles1 = const TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold, fontSize: 15,
    fontFamily: 'ArgentumSans',);

  @override
  Widget build (BuildContext context){
    return StatefulBuilder(
        builder: (context,refresh) {
          refresh((){
          });
          return Container(
            margin: const EdgeInsets.only(left:5,right: 5),
            // height: MediaQuery.of(context).size.height*0.5,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
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
                        controller: productDetail,
                        focusNode: productNode,
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(context, productNode, countNode);
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
                            refresh(() {
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
                            refresh(() {
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
                            refresh(() {
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
                          refresh(() {
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
                          refresh(() {
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
                          refresh(() {
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
                          refresh(() {
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
                                refresh(() {
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
                                refresh(() {
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
                                refresh(() {
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
                          )
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

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       children: [
                //
                //         SizedBox(
                //           child: DropdownButtonFormField(
                //             iconEnabledColor: Colors.grey,
                //             style: const TextStyle(
                //               color: Colors.grey,
                //               fontSize: 15,
                //               fontFamily: 'ArgentumSans',),
                //             decoration: InputDecoration(
                //               enabledBorder: OutlineInputBorder(
                //                 borderSide: const BorderSide(
                //                     color: Color(0xfff05acff)),
                //                 borderRadius: BorderRadius.circular(30),
                //               ),
                //               isDense: true,
                //               contentPadding: const EdgeInsets.fromLTRB(
                //                   10, 10, 10, 0),
                //               border: OutlineInputBorder(
                //                 borderRadius: BorderRadius.circular(30),
                //               ),
                //             ),
                //             value: selecTtyped,
                //             onChanged: (String? newValue) {
                //               print('$selecTtyped');
                //               refresh((){
                //                 selecTtyped = newValue ?? "";
                //                 print('$selecTtyped');
                //               });
                //             },
                //             items: _selecttypedList.map((location) {
                //               return DropdownMenuItem(
                //                 child: Text(location),
                //                 value: location,
                //               );
                //             }).toList(),
                //             validator: (value) {
                //               if (value == null || value == 0) {
                //                 return 'Please Choose Product Type';
                //               }
                //               return null;
                //             },
                //           ),
                //           width: 110,
                //         ),
                //       ],
                //     ),
                //     Column(
                //       children: [
                //         Text('Product Details', style: styles,),
                //         const SizedBox(height: 5,),
                //         SizedBox(
                //             width: MediaQuery
                //                 .of(context)
                //                 .size
                //                 .width * 0.52,
                //             child: TextFormField(
                //               textCapitalization: TextCapitalization.sentences,
                //               controller: ProductDetail,
                //               style: const TextStyle(color: Colors.grey,
                //                 fontSize: 15,
                //                 fontFamily: 'ArgentumSans',
                //               ),
                //               maxLines: 1,
                //               keyboardType: TextInputType.text,
                //               decoration: InputDecoration(
                //                 isDense: true,
                //                 contentPadding: const EdgeInsets.fromLTRB(
                //                     10, 10, 10, 0),
                //                 focusedBorder: OutlineInputBorder(
                //                     borderSide: const BorderSide(
                //                         color: Color(0xfff05acff)),
                //                     borderRadius: BorderRadius.circular(30)),
                //                 // labelText:'Product Details',
                //                 enabledBorder: OutlineInputBorder(
                //                   borderSide: const BorderSide(
                //                       color: Color(0xfff05acff)),
                //                   borderRadius: BorderRadius.circular(30),
                //                 ),
                //               ),
                //               validator: (text) {
                //                 if (text == null || text.isEmpty) {
                //                   return 'Text Can\'t Be Empty';
                //                 }
                //                 return null;
                //               },
                //             )),
                //       ],
                //     ),
                //   ],
                // ),

                SizedBox(height: 18,),
                // if(selecTtyped == 'Sack')
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           Text('Length', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child:Textfield(
                //                 controller: length1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),)
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Height', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: height1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20.0),
                //             child: Container(
                //               height: 160,
                //               width: 200,
                //               child: Column(
                //                 children: [
                //                   Text('Dimensions', style: styles,),
                //                   Container(
                //                     height: 140,
                //                     width: 170,
                //                     child: Image.asset(
                //                       'assets/images/sack.png',fit: BoxFit.contain,
                //                       // color: Color(0xfff015acff),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // if(selecTtyped == 'Roll')
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           Text('Height', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child:Textfield(
                //                 controller: height1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),)
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Diameter', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: length1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20.0),
                //             child: Container(
                //               height: 160,
                //               width: 200,
                //               child: Column(
                //                 children: [
                //                   Text('Dimensions', style: styles,),
                //                   Container(
                //                     height: 140,
                //                     width: 170,
                //                     child: Image.asset(
                //                       'assets/images/roll.png',fit: BoxFit.contain,
                //                       // color: Color(0xfff05acff),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // if(selecTtyped == 'Barrel')
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           Text('Height', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child:Textfield(
                //                 controller: height1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),)
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Diameter', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: length1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20.0),
                //             child: Container(
                //               height: 160,
                //               width: 200,
                //               child: Column(
                //                 children: [
                //                   Text('Dimensions', style: styles,),
                //                   Container(
                //                     height: 140,
                //                     width: 170,
                //                     child: Image.asset(
                //                       'assets/images/barrel.png',fit: BoxFit.contain,
                //                       // color: Color(0xfff05acff),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // if(selecTtyped == "Carton")
                //   Row  (
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           Text('Length', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 onChanged: (val){
                //                   refresh((){
                //                     valueUnitSize;
                //                   });
                //                 },
                //                 controller: length1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Breadth', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: breadth1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Height', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: height1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20.0),
                //             child: Container(
                //               height: 160,
                //               width: 200,
                //               child: Column(
                //                 children: [
                //                   Text('Dimensions', style: styles,),
                //                   Container(
                //                     height: 140,
                //                     width: 170,
                //                     child: Image.asset(
                //                       'assets/images/carton.png',fit: BoxFit.contain,
                //                       // color: Color(0xfff05acff),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // if(selecTtyped == "Crate")
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           const SizedBox(height: 10,),
                //           Text('Length', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: length1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Breadth', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: breadth1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )),
                //           const SizedBox(
                //             height: 10,
                //           ),
                //           Text('Height', style: styles,),
                //           const SizedBox(height: 5,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 controller: height1,
                //                 suffix: valueUnitSize == null ? Text(
                //                   _selectedUnitList[0],
                //                 ) :
                //                 Text(valueUnitSize.toString(),
                //                   style: const TextStyle(color: Colors.grey,
                //                     fontSize: 13,
                //                     fontFamily: 'ArgentumSans',
                //                   ),),
                //               )
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 20.0),
                //             child: Container(
                //               height: 160,
                //               width: 200,
                //               child: Column(
                //                 children: [
                //                   Text('Dimensions', style: styles,),
                //                   Container(
                //                     height: 140,
                //                     width: 170,
                //                     child: Image.asset(
                //                       'assets/images/crate.png',fit: BoxFit.contain,
                //                       // color: Color(0xfff05acff),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // const SizedBox(height: 10,),
                // Container(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Column(
                //         children: [
                //           Text('weight', style: styles,),
                //           const SizedBox(height: 7,),
                //           SizedBox(
                //             width: 100,
                //             child: Textfield(
                //               onChanged: (val){
                //                 print(valueUnitSize);
                //                 weight1();
                //                 volume1();
                //               },
                //               controller: weightControl1,
                //               suffix: valueUnit == null ? Text(
                //                   _selectedUnitWeightList[0]) : Text(
                //                   valueUnit.toString()),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Text('Count', style: styles,),
                //           const SizedBox(height: 7,),
                //           SizedBox(
                //               width: 100,
                //               child: Textfield(
                //                 onChanged:(val){
                //                   weight1();
                //                   volume1();
                //                 } ,
                //                 controller: countControl1,
                //                 suffix: const Text('no.s'),
                //               )),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 10,),
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Column(
                //         children: [
                //           Text('Total Load', style: styles,),
                //           const SizedBox(height: 7,),
                //           SizedBox(
                //             width: 100,
                //             child: Textfield(
                //               controller: newproduct,
                //               suffix: valueUnit == null ? Text(
                //                   _selectedUnitWeightList[0]) : Text(
                //                   valueUnit.toString()),
                //             ),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         children: [
                //           Text('Total Volume', style: styles,),
                //           const SizedBox(height: 7,),
                //           SizedBox(
                //             width: 100,
                //             child: Textfield(
                //               controller: weightControl2,
                //               suffix: valueUnitSize == null ? Text(
                //                 "${_selectedUnitList[0]}³",
                //               ) :
                //               Text(' ${valueUnitSize.toString()}³',
                //                 style: const TextStyle(color: Colors.grey,
                //                   fontSize: 13,
                //                   fontFamily: 'ArgentumSans',
                //                 ),),
                //             ),
                //           ),
                //         ],
                //       ),
                //
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        }
    );
  }
}
