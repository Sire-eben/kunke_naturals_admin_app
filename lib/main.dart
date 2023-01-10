import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/providers/auth_provider.dart';
import 'package:kunke_naturals_admin_app/core/providers/products_provider.dart';
import 'package:kunke_naturals_admin_app/presentation/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        // ChangeNotifierProvider(create: (_) => MakePayment(ctx: context)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: AppTheme.defaultTheme(context),
        home: const SplashScreen(),
      ),
    );
  }
}
