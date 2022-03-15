import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/Data/Models/clients.dart';
import 'package:hive_example/Domain/clients_view_models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import 'Presentation/splash_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///for dev
  HttpOverrides.global =  MyHttpOverrides();
  Directory appDocumentDir = await getApplicationDocumentsDirectory();
   Hive.init(appDocumentDir.path);
  Hive.registerAdapter(GetApprovedDetailsObjctAdapter());
  // Hive.registerAdapter(SourceAdapter());
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClientsViewModel>(create: (_) => ClientsViewModel()),
      ],
      child: ScreenUtilInit(
        builder:()=> MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ultimate',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen()
        ),
      ),
    );
  }
  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}