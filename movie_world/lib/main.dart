// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:movie_world/loginpage.dart';
import 'screens/screen.dart';


void main() {
  return runApp(MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({ Key? key }) : super(key: key);

  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        // title: snapshot.connectionState == ConnectionState.waiting ? '': 'side project',
        // theme: snapshot.connectionState == ConnectionState.waiting ? ThemeData():ThemeData(primarySwatch: Colors.blue,),
        // home: snapshot.connectionState == ConnectionState.waiting ? Splash() : LoginScreen()    
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen() 
            );
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'side project',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginScreen(),
          );
        }
      },
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}