import 'package:first_task2/Const/routes_app.dart';
import 'package:first_task2/bloc/Content/content_bloc.dart';
import 'package:first_task2/bloc/bloc/bloc/sub_category_bloc.dart';
import 'package:first_task2/bloc/bloc/login_bloc.dart';
import 'package:first_task2/bloc/bloc/trendy_bloc.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translate', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => ContentBloc(),
        ),
        BlocProvider(
          create: (context) => TrendyBloc(),
        ),
        BlocProvider(
          create: (context) => SubCategoryBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Fancy Dialog Example',

        // home: const Splash(),
        routerConfig: Myroute().router,
      ),
    );
  }
}
