import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product/manager/connectivity_manager.dart';
import 'core/extensions/app_extensions.dart';
import 'features/common/splash/view/splash_view.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';

void main() => runApp(
      DevicePreview(
        enabled: false,
        builder: (context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => ConnectivityManager(),
            )
          ],
          child: const MyApp(),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  static const String path = '/';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: NavigationRoute.generateRoute,
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: _theme(context),
        home: const SplashView(),
      );

  ThemeData _theme(BuildContext context) => ThemeData(
        primaryColor: context.primaryColor,
        scaffoldBackgroundColor: context.background,
        fontFamily: "Avenir",
      );
}
