
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knovator_task/base_controller.dart';
import 'package:knovator_task/core/constants/app_strings.dart';
import 'package:knovator_task/core/utils/utils.dart';
import 'package:knovator_task/routes/routes.dart';
import 'package:knovator_task/routes/routes_name.dart';
import 'core/utils/stretch_scroll_behavior.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils.lightStatusBar();
  Utils.screenPortrait();
  Utils.closeKeyboard();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          getPages: pages,
          initialRoute: RoutesName.formFillView,
          initialBinding: BaseBinding(),
          scrollBehavior: ScrollBehaviorModified(),
          builder: (context, child) {
            final mediaQueryData = MediaQuery.of(context);
            final scale = mediaQueryData.textScaler.clamp(
              minScaleFactor: 1.0,
              maxScaleFactor: 1.14,
            );
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: scale,
              ),
              child: child!,
            );
          },
        );
      },
    );
  }
}