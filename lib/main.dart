import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';
import 'package:taskzmi/pages/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: Center(
            child: SpinKitCubeGrid(
              color: Color(0xff1B9C42),
              size: 50.0,
            ),
          ),
          overlayColor: Colors.black,
          overlayOpacity: 0.8,
          duration: Duration(seconds: 2),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          ),
        );
      },
    );
  }
}
