import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../res/app_colors.dart';


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
List<String> listOfProducts=['1'];
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
    totalCalculate();
  }
  void dispose (){
    product.dispose();
  }

  int currentStep = 0;
  List<String> _selectedUnitList = ['cm', 'in', 'ft'];
  List<String> _selectedUnitWeightList = ['kg', 'Tonne'];
  List<String> _selecttypedList = ['Carton', 'Sack', 'Crate','Roll','Barrel'];
  // var valueUnit;
  var valueUnit1;
  double height1 = 30;
  Color? color1 = const Color(0xfff05acff);
  TextStyle? styles = const TextStyle(fontSize: 13,
      fontFamily: 'ArgentumSans', fontWeight: FontWeight.w500,
      color: Colors.black38);
  TextStyle? styles1 = const TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold, fontSize: 15,
    fontFamily: 'ArgentumSans',);
  TextStyle? stylesdrop = const TextStyle(color: Colors.white,
    fontSize: 14,
    fontFamily: 'ArgentumSans',);

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
  Future totalCalculate() async {
    var totalAmount =
        '${'AppUrl.apiUrl'}/chargeablenew';
    http.Response resp = await http.put(Uri.parse(totalAmount), body: {

      "type":
      // "Barrel",
      "$selecttyped",
      "diameter":
      // "100",
      length.text,
      "length":
      // "10",
      length.text,
      "breadth":
      // "10",
      breadth.text,
      "height":
      // "100",
      height.text,
      "lengthunit":
      // "cm",
      "$valueunitmain",
      "weightunit":
      "$valueUnit1",
      // "kg",
      "weight":
      // '10',
      "$finalWeight",
      "count":
      // '1',
      countControl.text,
      "distance":
      "100"
      // "$distance3"

    }
    );
    if (resp.statusCode == 200) {
      setState(() {
        total = jsonDecode(resp.body);
        chargeableWeight = total[0]['chargeableweight'];
        totalPrice = total[0]['billamount'];
        var a = totalPrice;
        bookingAdvance = a * 0.1;
        print(chargeableWeight);
        print(totalPrice);
        print(total);
      });
    }
  }
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

  final productDetail = TextEditingController();

  String typeSelected = 'Carton';
  String sizeSelected = 'Small';

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
  List<String> _selectedUnitList = ['cm', 'in', 'ft'];
  List<String> _selectedUnitWeightList = ['kg', 'Tonne'];
  List<String> _selecttypedList = ['Carton', 'Sack', 'Crate','Roll','Barrel'];
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
  TextStyle? stylesdrop = const TextStyle(color: Colors.white,
    fontSize: 14,
    fontFamily: 'ArgentumSans',);
  void volume1() {
    if (selecTtyped == 'Sack'&& height1.text.length!=0 &&
        length1.text.isNotEmpty&&countControl1.text.isNotEmpty) {
      double h = double.parse(height1.text == null ? '0' : height1.text.toString());
      double c = double.parse(countControl1.text == null ? '0' : countControl1.text);
      double l = double.parse(length1.text == null ? '0' : length1.text.toString());
      if(l>=h){
        if (valueUnitSize == 'cm') {
          vol = l * (l / 2) * h * (0.01 * 0.01 * 0.01);
          totalVolumeC = vol * c;

          weightControl2.text=totalVolumeC.toStringAsFixed(2);
          vol1 = l * (l / 2) * h * 100;
        }
        else if (valueUnitSize == 'in') {
          vol = l * (l / 2) * h * (0.0254 * 0.0254 * 0.0254);
          totalVolumeC = vol * c;
          weightControl2.text=totalVolumeC.toStringAsFixed(2);
        }
        else {
          vol = l * (l / 2) * h * (0.3048 * 0.3048 * 0.3048);
          totalVolumeC = vol * c;
          weightControl2.text=totalVolumeC.toStringAsFixed(2);
        }
      }
      else{
        if (valueUnitSize == 'cm') {
          vol = l * (h / 2) * h * (0.01 * 0.01 * 0.01);
          totalVolumeC = vol * c;
          weightControl2.text=totalVolumeC.toStringAsFixed(2);
          vol1 = l * (h / 2) * h * 100;
        }
        else if (valueUnitSize == 'in') {
          vol = l * (h / 2) * h * (0.0254 * 0.0254 * 0.0254);
          totalVolumeC = vol * c;
          weightControl2.text=totalVolumeC.toStringAsFixed(2);

        }
        else {
          vol = l * (h / 2) * h * (0.3048 * 0.3048 * 0.3048);
          totalVolumeC = vol * c;
          weightControl2.text=totalVolumeC.toStringAsFixed(2);
          print(vol);
        }
      }
    }
    else if((selecTtyped == 'Carton'||selecTtyped == 'Crate')&&
        (height1.text.length!=0&&length1.text.length!=0&&
            breadth1.text.length!=0&&countControl1.text.length!=0)){
      double h = double.parse(height1.text == null ? '0' : height1.text.toString());
      double w = double.parse(breadth1.text == null ? '0' : breadth1.text.toString());
      double l = double.parse(length1.text == null ? '0' : length1.text.toString());
      double c = double.parse(countControl1.text == null ? '0' : countControl1.text);

      if (valueUnitSize == 'cm') {
        vol = l * w * h * (0.01 * 0.01 * 0.01);
        totalVolumeC = vol * c;
        weightControl2.text=totalVolumeC.toStringAsFixed(2);
      }
      else if (valueUnitSize == 'in') {
        vol = l * w * h * (0.0254 * 0.0254 * 0.0254);
        totalVolumeC = vol * c;
        weightControl2.text=totalVolumeC.toStringAsFixed(2);

      }
      else {
        vol = l * w * h * (0.3048 * 0.3048 * 0.3048);
        totalVolumeC = vol * c;
        weightControl2.text=totalVolumeC.toStringAsFixed(2);

      }
    }
    else {
      if (height1.text.isNotEmpty&&length1.text.isNotEmpty&&countControl1.text.isNotEmpty){
        double c = double.parse(countControl1.text == null ? '0' : countControl1.text);
        double h = double.parse(height1.text == null ? '0' : height1.text.toString());

        print('roll');
        double d = double.parse(
            length1.text == null ? '0' : length1.text.toString());
        if (valueUnitSize == 'cm') {
          vol = d * d * h * (0.01 * 0.01 * 0.01);
          totalVolumeC = vol * c;
          weightControl2.text = totalVolumeC.toStringAsFixed(2);
          print("totalvol:$totalVolumeC");
          print(vol);
        }
        else if (valueUnitSize == 'in') {
          vol = d * d * h * (0.0254 * 0.0254 * 0.0254);
          totalVolumeC = vol * c;
          weightControl2.text = totalVolumeC.toStringAsFixed(2);
          print(vol);
        }
        else {
          vol = d * d * h * (0.3048 * 0.3048 * 0.3048);
          totalVolumeC = vol * c;
          weightControl2.text = totalVolumeC.toStringAsFixed(2);
          print(vol);
        }
      }
    }
    finalTotal();
    // totalVolume1 = l*w*h;
  }
  void weight1() {
    if( weightControl1.text.length!=0&&countControl1.text.length!=0){
      double w = double.parse(
          weightControl1.text == null ? '0' : weightControl1.text);
      double c = double.parse(
          countControl1.text == null ? '0' : countControl1.text);
      totalWeight = c * w;
      newproduct.text = totalWeight.toString();
      print(totalWeight);
      volume1();
    }
    finalTotal();
  }
  var volumeTotal;
  var weightTotal;
  double vol = 0;
  @override
  Widget build (BuildContext context){
    return StatefulBuilder(
        builder: (context,refresh) {
          refresh((){
            volume1();
            weight1();
            finalTotal();
          });
          return Container(
            margin: const EdgeInsets.only(left:5,right: 5),
            // height: MediaQuery.of(context).size.height*0.5,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                                decoration: InputDecoration(border: InputBorder.none),
                                // Other TextField properties...
                              ),

                            ),
                          ),
                        ),
                        SizedBox(height: 2.h,),

                        // SizedBox(
                        //   child: DropdownButtonFormField(
                        //     iconEnabledColor: Colors.grey,
                        //     style: const TextStyle(
                        //       color: Colors.grey,
                        //       fontSize: 15,
                        //       fontFamily: 'ArgentumSans',),
                        //     decoration: InputDecoration(
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: const BorderSide(
                        //             color: Color(0xfff05acff)),
                        //         borderRadius: BorderRadius.circular(30),
                        //       ),
                        //       isDense: true,
                        //       contentPadding: const EdgeInsets.fromLTRB(
                        //           10, 10, 10, 0),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(30),
                        //       ),
                        //     ),
                        //     value: selecTtyped,
                        //     onChanged: (String? newValue) {
                        //       print('$selecTtyped');
                        //       refresh((){
                        //         selecTtyped = newValue ?? "";
                        //         print('$selecTtyped');
                        //       });
                        //     },
                        //     items: _selecttypedList.map((location) {
                        //       return DropdownMenuItem(
                        //         child: Text(location),
                        //         value: location,
                        //       );
                        //     }).toList(),
                        //     validator: (value) {
                        //       if (value == null || value == 0) {
                        //         return 'Please Choose Product Type';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   width: 110,
                        // ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Product Details', style: styles,),
                        const SizedBox(height: 5,),
                        SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.52,
                            child: TextFormField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: ProductDetail,
                              style: const TextStyle(color: Colors.grey,
                                fontSize: 15,
                                fontFamily: 'ArgentumSans',
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10, 10, 10, 0),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xfff05acff)),
                                    borderRadius: BorderRadius.circular(30)),
                                // labelText:'Product Details',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xfff05acff)),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Text Can\'t Be Empty';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18,),
                if(selecTtyped == 'Sack')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Length', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child:Textfield(
                                controller: length1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),)
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Height', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: height1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Dimensions', style: styles,),
                                  Container(
                                    height: 140,
                                    width: 170,
                                    child: Image.asset(
                                      'assets/images/sack.png',fit: BoxFit.contain,
                                      // color: Color(0xfff015acff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if(selecTtyped == 'Roll')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Height', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child:Textfield(
                                controller: height1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),)
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Diameter', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: length1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Dimensions', style: styles,),
                                  Container(
                                    height: 140,
                                    width: 170,
                                    child: Image.asset(
                                      'assets/images/roll.png',fit: BoxFit.contain,
                                      // color: Color(0xfff05acff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if(selecTtyped == 'Barrel')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Height', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child:Textfield(
                                controller: height1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),)
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Diameter', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: length1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Dimensions', style: styles,),
                                  Container(
                                    height: 140,
                                    width: 170,
                                    child: Image.asset(
                                      'assets/images/barrel.png',fit: BoxFit.contain,
                                      // color: Color(0xfff05acff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if(selecTtyped == "Carton")
                  Row  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Length', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                onChanged: (val){
                                  refresh((){
                                    valueUnitSize;
                                  });
                                },
                                controller: length1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Breadth', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: breadth1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Height', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: height1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Dimensions', style: styles,),
                                  Container(
                                    height: 140,
                                    width: 170,
                                    child: Image.asset(
                                      'assets/images/carton.png',fit: BoxFit.contain,
                                      // color: Color(0xfff05acff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                if(selecTtyped == "Crate")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text('Length', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: length1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Breadth', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: breadth1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('Height', style: styles,),
                          const SizedBox(height: 5,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                controller: height1,
                                suffix: valueUnitSize == null ? Text(
                                  _selectedUnitList[0],
                                ) :
                                Text(valueUnitSize.toString(),
                                  style: const TextStyle(color: Colors.grey,
                                    fontSize: 13,
                                    fontFamily: 'ArgentumSans',
                                  ),),
                              )
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Container(
                              height: 160,
                              width: 200,
                              child: Column(
                                children: [
                                  Text('Dimensions', style: styles,),
                                  Container(
                                    height: 140,
                                    width: 170,
                                    child: Image.asset(
                                      'assets/images/crate.png',fit: BoxFit.contain,
                                      // color: Color(0xfff05acff),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(height: 10,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('weight', style: styles,),
                          const SizedBox(height: 7,),
                          SizedBox(
                            width: 100,
                            child: Textfield(
                              onChanged: (val){
                                print(valueUnitSize);
                                weight1();
                                volume1();
                              },
                              controller: weightControl1,
                              suffix: valueUnit == null ? Text(
                                  _selectedUnitWeightList[0]) : Text(
                                  valueUnit.toString()),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Count', style: styles,),
                          const SizedBox(height: 7,),
                          SizedBox(
                              width: 100,
                              child: Textfield(
                                onChanged:(val){
                                  weight1();
                                  volume1();
                                } ,
                                controller: countControl1,
                                suffix: const Text('no.s'),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Total Load', style: styles,),
                          const SizedBox(height: 7,),
                          SizedBox(
                            width: 100,
                            child: Textfield(
                              controller: newproduct,
                              suffix: valueUnit == null ? Text(
                                  _selectedUnitWeightList[0]) : Text(
                                  valueUnit.toString()),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total Volume', style: styles,),
                          const SizedBox(height: 7,),
                          SizedBox(
                            width: 100,
                            child: Textfield(
                              controller: weightControl2,
                              suffix: valueUnitSize == null ? Text(
                                "${_selectedUnitList[0]}³",
                              ) :
                              Text(' ${valueUnitSize.toString()}³',
                                style: const TextStyle(color: Colors.grey,
                                  fontSize: 13,
                                  fontFamily: 'ArgentumSans',
                                ),),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}

// class FriendTextFields extends StatefulWidget {
//   final int index;
//   FriendTextFields(this.index);
//   @override
//   _FriendTextFieldsState createState() => _FriendTextFieldsState();
// }
//
// class _FriendTextFieldsState extends State<FriendTextFields> {
//   late TextEditingController _nameController;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _nameController.text = _BookingDetailsState.listOfProducts[widget.index] ?? '';
//     });
//
//     return TextFormField(
//       controller: _nameController,
//       onChanged: (v) => _BookingDetailsState.listOfProducts[widget.index] = v,
//       decoration: InputDecoration(
//           hintText: 'Enter your'
//       ),
//       validator: (v){
//         if(v!.trim().isEmpty) return 'Please enter something';
//         return null;
//       },
//     );
//   }
// }
// Padding(
// padding: const EdgeInsets.only(bottom: 10),
// child: Container(
// height: MediaQuery.of(context).size.height*0.66,
// width: MediaQuery.of(context).size.width,
// child: Scrollbar(
// radius: Radius.circular(20),
// thickness: 10,
// thumbVisibility: true,
// controller: scrollController,
// child: ListView.builder(
// controller: scrollController,
// scrollDirection: Axis.horizontal,
// itemCount: listDynamic.length,
// itemBuilder: (BuildContext ,index)
// {
// return Column(children: [
// CircleAvatar(
// child: Text("${index+1}",
// style: TextStyle(fontSize: 10),),
// radius: 8,),
// listDynamic[index],
// ElevatedButton(
// onPressed:  () {
// setState(() {
// if(listDynamic.length>1) {
// listDynamic.removeAt(index);
// }
// });
//
// // removeDynamic();
//
// },
// child:
// Container(
// width: 300,
// height: 100,
// alignment: Alignment.center,
// child: Padding(
// padding: const EdgeInsets.only(left: 8.0,right: 8.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// const Text(
// 'remove',
// style: TextStyle(fontFamily: 'ArgentumSans',
// fontSize: 14,),
// ),
// ],
// ),
// ),
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(20),
// ),
// ),
// style: ElevatedButton.styleFrom(
// minimumSize: const Size(130, 30),
// maximumSize: const Size(130, 30),
// padding: EdgeInsets.zero,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20))
//
// ),
// ),
//
//
// ],
// );}),
// ),
// ),
// ),