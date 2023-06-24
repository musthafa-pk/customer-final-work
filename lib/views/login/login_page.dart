import 'dart:async';
import 'dart:convert';

import 'package:chaavie_customer/res/app_colors.dart';
import 'package:chaavie_customer/utils/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart'as http;

const List<String> scopes = ['email','https://www.googleapis.com/auth/contacts.readonly'];
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: scopes,
);

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GoogleSignInAccount? currentUser;
  bool isAuthorized = false; // has granted permissions?
  String contactText = '';

  final _passwordController=TextEditingController();
  bool isLoading = false;

  int _value=1;
  bool _isObscure = true;
  bool navigateToPage = false;
  bool _isVisible = false;
  final _otpController=TextEditingController();
  final userNameController = TextEditingController();


  // Future<void> handleGoogleSignIn() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //     if (googleUser != null) {
  //       var email = googleUser.email.toString();
  //       print(email);
  //       // Successful sign-in, you can now use googleUser to access user details
  //       // For example, googleUser.email, googleUser.displayName, etc.
  //     }
  //   } catch (error) {
  //     // Handle the sign-in error
  //     print('Google Sign-In Error: $error');
  //   }
  // }








  @override
  void initState() {
    // TODO: implement initState
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      bool isAuthorized = account != null;
      if (kIsWeb && account != null) {
        isAuthorized = await _googleSignIn.canAccessScopes(scopes);
      }
      setState(() {
        currentUser = account;
        isAuthorized = isAuthorized;
      });
      if (isAuthorized) {
        unawaited(_handleGetContact(account!));
      }
      _googleSignIn.signInSilently();
    });
    super.initState();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user)async{
    setState(() {
      contactText = 'Loading contact info.....';
    });
    final http.Response response = await http.get(Uri.parse(
        'https://people.googleapis.com/v1/people/me/connections?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      setState(() {
        contactText = 'People API gave a ${response.statusCode} '
            'response. Check logs for details.';
      });
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
    final String? namedContact = _pickFirstNamedContact(data);
    setState(() {
      if (namedContact != null) {
        contactText = 'I see you know $namedContact!';
      } else {
        contactText = 'No contacts to display.';
      }
    });
  }

  String? _pickFirstNamedContact(Map<String, dynamic> data) {
    final List<dynamic>? connections = data['connections'] as List<dynamic>?;
    final Map<String, dynamic>? contact = connections?.firstWhere(
          (dynamic contact) => (contact as Map<Object?, dynamic>)['names'] != null,
      orElse: () => null,
    ) as Map<String, dynamic>?;
    if (contact != null) {
      final List<dynamic> names = contact['names'] as List<dynamic>;
      final Map<String, dynamic>? name = names.firstWhere(
            (dynamic name) =>
        (name as Map<Object?, dynamic>)['displayName'] != null,
        orElse: () => null,
      ) as Map<String, dynamic>?;
      if (name != null) {
        return name['displayName'] as String?;
      }
    }
    return null;
  }

  Future<void> _handleSignIn()async{
    try{
      await _googleSignIn.signIn();
    }catch(e){
      throw e;
    }
  }

  Future<void> _handleAuthorizeScopes() async {
    bool isAuthorized = await _googleSignIn.requestScopes(scopes);
    setState(() {
      isAuthorized = isAuthorized;
    });
    if (isAuthorized) {
      unawaited(_handleGetContact(currentUser!));
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 370,
                  width: MediaQuery.of(context).size.width,
                  child:Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/google.png'),
                          fit: BoxFit.cover
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Row(
                            children: [
                              Text(
                                'Welcome\nback',
                                style:TextStyle(
                                  fontFamily: 'ArgentumSans',
                                  color: Colors.black,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              CupertinoButton(child: Text(''),
                                  onPressed: (){

                                  })
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              // SizedBox(
                              //   height: 100,
                              //   child: Image.asset('assets/images/group-1.png',
                              //     scale: 2,color: Colors.black,),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 100,),
                          const Text('Login',
                            style:TextStyle(
                              fontFamily: 'ArgentumSans',
                              color: Color(0XFFF05ACFF),
                              fontSize: 40,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: 1,
                          groupValue: _value,
                          activeColor:Color(0XFFF05ACFF),
                          onChanged: (value){
                            setState(() {
                              _value= value as int ;
                              navigateToPage = false;
                            });
                          },
                        ),
                        Text('Password'),
                        Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value){
                            setState(() {
                              _value= value as int ;
                              navigateToPage = true;
                            });
                            // if (navigateToPage) {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (ctx)=>OtpLogin()));
                            // }
                          },
                        ),
                        Text('Login with otp'),
                      ],
                    ),
                  ],
                ),
                navigateToPage?
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    children: [
                      TextField(
                        controller: userNameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'User name',
                        ),
                      ),
                      if(_isVisible)
                        TextField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          obscureText: _isObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(onPressed: (){
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }, icon: Icon(_isObscure?Icons.visibility:Icons.visibility_off)),
                              hintText: 'OTP'
                          ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){

                          },
                              child: const Text('forgot password?')),
                        ],
                      ),
                      if(!_isVisible)
                        ElevatedButton(onPressed: userNameController.text.length==0 ? null : (){
                          // generateOtp();
                          setState(() {
                            _isVisible=!_isVisible;
                          });
                        },
                          child: Text('Generate OTP',style: TextStyle(fontSize: 20),),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(430, 40),
                            maximumSize:  Size(430, 40),
                          ),
                        ),
                      ElevatedButton(onPressed: _otpController.text.length==0 ? null : (){
                        setState(() {
                          // check();
                          // usernameGet();
                        });
                      },
                        child: const Text('Enter OTP',style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 40),
                          maximumSize:  Size(430, 40),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New here?'),
                          TextButton(onPressed: (){},
                              child: const Text('signup')),
                        ],
                      ),
                    ],
                  ),
                ):
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          TextField(
                            controller: userNameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'User name',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextField(
                            controller: _passwordController,
                            obscureText: _isObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(onPressed: (){
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }, icon: Icon(_isObscure?Icons.visibility:Icons.visibility_off)),
                                hintText: 'password'
                            ),),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){
                            // print(apiurl);
                            // Register.openurlReg();
                          },
                              child: const Text('forgot password?')),
                        ],
                      ),
                      ElevatedButton(onPressed: userNameController.text.length==0 ? null :() async {
                        setState(()  {
                          isLoading = true;
                          // loginPassword();
                          // checkEmail();
                          // usernameGet();
                        });
                        await Future.delayed(const Duration(seconds: 20));
                        setState(() {
                          isLoading = false;
                          Navigator.pushNamed(context, RoutesName.first_page);
                        });
                        print('pressed');
                      },
                        child:(isLoading)
                            ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Logging in',
                              style:TextStyle(
                                fontFamily: 'ArgentumSans',
                                color: Colors.white70,
                              ),),
                            SizedBox(width: 5,),
                            LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white70,
                              size: 20,
                            ),
                          ],
                        )
                            : const Text('Login',style: TextStyle(fontSize: 20),),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(430, 40),
                          maximumSize:  Size(430, 40),
                        ),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                      //   onPressed: () async {
                      //     setState(() {
                      //       isLoading = true;
                      //     });
                      //     await Future.delayed(const Duration(seconds: 5));
                      //     setState(() {
                      //       isLoading = false;
                      //     });
                      //   },
                      //   child: (isLoading)
                      //       ? const SizedBox(
                      //       width: 16,
                      //       height: 16,
                      //       child: CircularProgressIndicator(
                      //         color: Colors.white,
                      //         strokeWidth: 1.5,
                      //       ))
                      //       : const Text('Submit'),
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New here?'),
                          TextButton(onPressed: (){
                            // Register.openurlReg();
                          },
                            child: const Text('signup',style: TextStyle(decoration: TextDecoration.underline,),),
                          ),
                        ],
                      ),

                      InkWell(
                        onTap: (){

                          Navigator.pushNamed(context, RoutesName.first_page);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1,color: AppColors.buttonsColor)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height:50,
                                  child: Image.asset('./assets/images/google.png')),
                              SizedBox(width: 30,),
                              Text('SignIn with Google')
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
