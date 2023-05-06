import 'package:flutter/material.dart';
import 'package:tokopedia_flutter/ui/pages/home_page.dart';
import 'package:tokopedia_flutter/ui/theme/app_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tokopedia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.green,
        ),
      ),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
