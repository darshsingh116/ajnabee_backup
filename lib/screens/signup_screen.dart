import 'package:ajnabee/bloc/auth/auth_bloc.dart';
import 'package:ajnabee/bloc/auth/auth_event.dart';
import 'package:ajnabee/bloc/auth/auth_state.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:ajnabee/screens/landing_page.dart';
import 'package:ajnabee/screens/landing_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user_model.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  final nameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final mobileEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authRepository = context.read<FirebaseRepository>();

    final nameField = TextFormField(
      controller: nameEditingController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.person,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        nameEditingController.text = value!;
      },
    );
    final emailField = TextFormField(
      controller: emailEditingController,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return ('Please Enter Your Email');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
    );
    final mobileField = TextFormField(
      controller: mobileEditingController,
      autofocus: false,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your Number';
        }

        return null;
      },
      onSaved: (value) {
        mobileEditingController.text = value!;
      },
    );
    final passwordField = TextFormField(
      controller: passwordEditingController,
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Passsword',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for signup");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
    );

    //BLOC STARTS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~////////////////////

    return Container(
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      // TODO: implement listener

      if (state is AuthStateLoggedOut) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else if (state is AuthStateLoggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RootPage()));
      }
    }, builder: (context, state) {
      // if (state is AuthStateInitial) {
      //   print("initializing....");
      //   context
      //       .read<AuthBloc>()
      //       .add(AuthEventInitialize(authRepository: authRepository));
      //   return Container();
      // } else 
      if (state is AuthStateIsInRegistrationView ||
          state is AuthStateIsLoading) {
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            "Create an account,",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Please type full information below and we can create your account",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      nameField,
                      const SizedBox(
                        height: 25,
                      ),
                      emailField,
                      const SizedBox(
                        height: 25,
                      ),
                      mobileField,
                      const SizedBox(height: 25.0),
                      passwordField,
                      Row(
                        children: [
                          const Text("By signing up you agree to our"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Term of use and privacy ',
                              style: TextStyle(
                                color: Color(0xFFFFD600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("notice"),
                      ),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            final email = emailEditingController.text;
                            final password = passwordEditingController.text;
                            final mobile = mobileEditingController.text;
                            final name = nameEditingController.text;
                            if (email != "" &&
                                password != "" &&
                                mobile != "" &&
                                name != "") {
                              context.read<AuthBloc>().add(Register(
                                    email: email,
                                    password: password,
                                    mobileNumber: int.parse(mobile),
                                    name: name,
                                    authRepository: authRepository,
                                  ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFD600),
                          ),
                          child: const Text(
                            'Join Now',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 343,
                        height: 22,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 164,
                              top: 0,
                              child: Text(
                                'or',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: 0.27,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 130,
                              top: 12,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(0.0, 0.0)
                                  ..rotateZ(-3.14),
                                child: Container(
                                  width: 130,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 343,
                              top: 12,
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..translate(0.0, 0.0)
                                  ..rotateZ(3.14),
                                child: Container(
                                  width: 130,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        strokeAlign:
                                            BorderSide.strokeAlignCenter,
                                        color: Color(0xFFD1D5DB),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // login with google
                        },
                        style: ElevatedButton.styleFrom(
                          maximumSize: const Size(350, 60),
                          primary: Colors.white,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/login/google.png")),
                            SizedBox(width: 10),
                            Text(
                              "Join with Google",
                              style: TextStyle(
                                color: Color(0xFFFFD600),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                    .read<AuthBloc>()
                                    .add(AuthEventGoToLogin());
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                color: Color(0xFFFFD600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
      }
      return Container();
    }));
  }
}
