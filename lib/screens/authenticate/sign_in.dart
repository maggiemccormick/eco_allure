import 'package:eco_allure/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:eco_allure/eco_allure_app_theme.dart';
import '../../shared/constants.dart';
import '../../shared/loading.dart';
import '../../widgets/snackbar.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key? key}) : super(key: key);

  // final Function toggleView;
  // SignIn({ required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  bool _obscureTextPassword = true;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  void dispose() {
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 240.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: focusNodeEmail,
                            controller: loginEmailController,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                                size: 22.0,
                              ),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                  fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                            ),
                            validator: (String? value) {
                              if (value != null && value.isEmpty) {
                                return "Email can't be empty";
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                            // onSubmitted: (_) {
                            //   focusNodePassword.requestFocus();
                            // },
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 1.0,
                          color: Colors.grey[400],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: TextFormField(
                            focusNode: focusNodePassword,
                            controller: loginPasswordController,
                            obscureText: _obscureTextPassword,
                            validator: (String? value) {
                              if (value != null && value.length < 6) {
                                return "Enter a password 6+ chars long";
                              }
                              return null;
                            },
                            style: const TextStyle(
                                fontFamily: 'WorkSansSemiBold',
                                fontSize: 16.0,
                                color: Colors.black),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: const Icon(
                                Icons.lock,
                                size: 22.0,
                                color: Colors.black,
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                  fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(
                                  _obscureTextPassword
                                      ? Icons.remove_red_eye_outlined
                                      : Icons.remove_red_eye_outlined,
                                  size: 15.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                            // onSubmitted: (_) {
                            //   _toggleSignInButton();
                            // },
                            textInputAction: TextInputAction.go,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 220.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: EcoAllureAppTheme.loginGradientStart,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                    BoxShadow(
                      color: EcoAllureAppTheme.loginGradientEnd,
                      offset: Offset(1.0, 6.0),
                      blurRadius: 20.0,
                    ),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        EcoAllureAppTheme.loginGradientEnd,
                        EcoAllureAppTheme.loginGradientStart
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                  highlightColor: Colors.transparent,
                  splashColor: EcoAllureAppTheme.loginGradientEnd,
                  child: const Padding(
                    padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontFamily: 'WorkSansBold'),
                    ),
                  ),
                  onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      // setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if (result == null){
                        CustomSnackBar(context, const Text('Could not sign in with those credentials'));
                        setState(() {
                          error = 'Could not sign in with those credentials';
                          //loading = false;
                        });
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignInButton() {
    CustomSnackBar(context, const Text('Login button pressed'));
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextPassword = !_obscureTextPassword;
    });
  }
    //Scaffold(
    //   backgroundColor: Colors.brown[100],
    //   appBar: AppBar(
    //     backgroundColor: Colors.brown[400],
    //     elevation: 0.0,
    //     title: Text("Sign in to EcoAllure"),
    //     actions: <Widget>[
    //       FlatButton.icon(
    //           onPressed: () {
    //             widget.toggleView();
    //           },
    //           icon: Icon(Icons.person),
    //           label: Text('Register'),
    //       ),
    //     ]
    //   ),
    //   body: Container(
    //     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
    //     child: Form(
    //       key: _formKey,
    //       child: Column(
    //         children: <Widget>[
    //           SizedBox(height: 20.0),
    //           TextFormField(
    //             decoration: textInputDecoration.copyWith(hintText: 'Email'),
    //             validator: (String? value) {
    //               if (value != null && value.isEmpty) {
    //                 return "Username can't be empty";
    //               }
    //               return null;
    //             },
    //             onChanged: (val) {
    //               setState(() => email = val);
    //             },
    //           ),
    //           SizedBox(height: 20.0),
    //           TextFormField(
    //             decoration: textInputDecoration.copyWith(hintText: 'Password'),
    //             validator: (String? value) {
    //               if (value != null && value.length < 6) {
    //                 return "Enter a password 6+ chars long";
    //               }
    //               return null;
    //             },
    //             obscureText: true,
    //             onChanged: (val) {
    //               setState(() => password = val);
    //             },
    //           ),
    //           SizedBox(height: 20.0),
    //           RaisedButton(
    //             color: Colors.pink[400],
    //             child: Text(
    //               'Sign In',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //             onPressed: () async {
    //               if(_formKey.currentState!.validate()){
    //                 setState(() => loading = true);
    //                 dynamic result = await _auth.signInWithEmailAndPassword(email, password);
    //                 if (result == null){
    //                   setState(() {
    //                     error = 'Could not sign in with those credentials';
    //                     loading = false;
    //                   });
    //                 }
    //               }
    //             },
    //           ),
    //           SizedBox(height: 12.0),
    //           Text(
    //             error,
    //             style: TextStyle(color: Colors.red, fontSize: 14.0),
    //           ),
    //         ]
    //       ),
    //     ),
    //   )
    // );
  }

