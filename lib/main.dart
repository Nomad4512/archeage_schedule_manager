import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_manager/aasm_app.dart';

import 'widgets/navigation_bar_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationBarProvider(),
      child: const AasmApp(),
    ),
  );
}
