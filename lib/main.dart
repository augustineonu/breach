import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routes/app_pages.dart';

void main() async {
   await GetStorage.init();
  runApp(const Breach());
}

class Breach extends StatelessWidget {
  const Breach({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X as reference
      builder: (_, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Breach",
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            fontFamily: 'Inter',
            textTheme:  TextTheme(
              bodyMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              bodySmall: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
              titleLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }
}
