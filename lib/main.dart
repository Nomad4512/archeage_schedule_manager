import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule_manager/aasm_app.dart';

import 'widgets/navigation_bar_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NavigationBarProvider(),
      child: const AasmApp(),
    ),
  );
}
