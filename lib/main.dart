import 'package:caxita/controller/flight_provider.dart';
import 'package:caxita/view/Home/home_screen.dart';
import 'package:caxita/view/splash/splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true, 
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder, 
        home: SplashPage(),
      );
  }
}
