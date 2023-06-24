import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
class RecipientAddressPage extends StatefulWidget {
  const RecipientAddressPage({Key? key}) : super(key: key);

  @override
  State<RecipientAddressPage> createState() => _RecipientAddressPageState();
}

class _RecipientAddressPageState extends State<RecipientAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('RECIPIENT ADDRESS BOOK',style: TextStyle(
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

                ListView.builder(
                    itemCount:2,
                    shrinkWrap: true,
                    itemBuilder: (context,index) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.add_home,color: AppColors.buttonsColor),
                            trailing: InkWell(
                                onTap:(){
                                  setState(() {
                                  });
                                },
                                child: Icon(Icons.domain_verification_rounded,color: AppColors.buttonsColor,)),
                            title: Text('Label',style: TextStyle(
                                color: AppColors.buttonsColor
                            ),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Address', style: TextStyle(
                                  color: AppColors.buttonsColor,
                                ),),
                                Text('Pin:'+ '123456',style: TextStyle(
                                  color: AppColors.buttonsColor,
                                ),),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black12,
                          ),
                        ],
                      );
                    }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
