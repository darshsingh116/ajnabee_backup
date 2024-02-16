import 'package:ajnabee/bloc/auth/auth_bloc.dart';
import 'package:ajnabee/bloc/auth/auth_event.dart';
import 'package:ajnabee/bloc/auth/auth_state.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:ajnabee/screens/forgot_password.dart';
import 'package:ajnabee/screens/landing_page.dart';
import 'package:ajnabee/screens/signup_screen.dart';
import 'package:ajnabee/screens/landing_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formkey = GlobalKey<FormState>();

  //editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final authRepository = context.read<FirebaseRepository>();

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: 'Password',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
    //login button
    final loginButton = SizedBox(
      height: 50,
      width: 400,
      child: ElevatedButton(
        onPressed: () {
          final email = emailController.text;
                                      final password = passwordController.text;
                                      context.read<AuthBloc>().add(LogIn(
                                            email: email,
                                            password: password,
                                            authRepository: authRepository,
                                          ));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFD600),
        ),
        child: const Text(
          ' In',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

    //BLOC STARTS ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~////////////////////

    
    //context.read<AuthBloc>().emit(AuthStateLoggedOut());

    return Container(
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      // TODO: implement listener
      if (state is AuthStateIsInRegistrationView) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      } else if (state is AuthStateLoggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => RootPage()));
      }
    }, builder: (context, state) {
      if (state is AuthStateInitial) {
        print("initializing....");
        context
            .read<AuthBloc>()
            .add(AuthEventInitialize(authRepository: authRepository));
        return Container();
      } else if (state is AuthStateLoggedOut || state is AuthStateIsLoading) {
        return SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                            "Welcome back,",
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
                          "Glad to meet you again!, please login to use the app.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 150,
                      ),
                      emailField,
                      const SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFFFFD600),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      loginButton,
                      const SizedBox(height: 16.0),
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
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                            // signInWithGoogle();
                            // if (mounted) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) => const HomePage(),
                            //     ),
                            //   );
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage("assets/login/google.png")),
                              SizedBox(width: 10),
                              Text(
                                "Sign In with Google",
                                style: TextStyle(
                                  color: Color(0xFFFFD600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don\'t have an account?"),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              context
                                      .read<AuthBloc>()
                                      .add(AuthEventGoToRegistration());
                            },
                            child: const Text(
                              'Join Now',
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

  // void signIn(String email, String password) async {
  //   if (_formkey.currentState!.validate()) {
  //     await _auth
  //         .signInWithEmailAndPassword(email: email, password: password)
  //         .then((uid) => {
  //               Fluttertoast.showToast(msg: 'Login Successful'),
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(builder: (context) => const HomePage()),
  //               )
  //             })
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }
}
