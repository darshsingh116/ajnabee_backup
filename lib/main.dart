import 'package:ajnabee/bloc/auth/auth_bloc.dart';
import 'package:ajnabee/bloc/home/bloc/home_bloc.dart';
import 'package:ajnabee/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:ajnabee/firebase_options.dart';
import 'package:ajnabee/repositories/firebase_repo.dart';
import 'package:ajnabee/repositories/firebase_storage_repo.dart';
<<<<<<< HEAD
import 'package:ajnabee/screens/after_booking/booking_done.dart';
import 'package:ajnabee/screens/after_booking/pagenotfound.dart';
import 'package:ajnabee/screens/boarding_screen.dart';
import 'package:ajnabee/screens/login_screen.dart';
import 'package:ajnabee/screens/salon_details.dart';
=======
>>>>>>> 2d6c908210df52a4141f5c4b5eaa9e1e6176ad79
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<FirebaseRepository>(
              create: (context) => FirebaseRepository()),
          RepositoryProvider<FirebaseStoreageRepo>(
              create: (context) => FirebaseStoreageRepo()),
        ],
<<<<<<< HEAD
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: const RootPage(),
      home: LoginScreen()
    )));
=======
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                  create: (BuildContext context) => AuthBloc()),
              BlocProvider<HomeBloc>(
                  create: (BuildContext context) => HomeBloc()),
              BlocProvider<NavigationBloc>(
                  create: (BuildContext context) => NavigationBloc()),
            ],
            child: MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                  primarySwatch: Colors.amber,
                  useMaterial3: true,
                ),
                debugShowCheckedModeBanner: false,
                //home: const RootPage(),
                home: RootPage())));
>>>>>>> 2d6c908210df52a4141f5c4b5eaa9e1e6176ad79
  }
}
