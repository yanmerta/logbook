import 'package:flutter/material.dart';
import 'package:logbook/pages/home_page.dart';
import 'package:logbook/providers/auth.dart';

import 'package:provider/provider.dart';

import './providers/products.dart';

// import './pages/home_page.dart';
import './pages/auth_page.dart';
import './pages/add_product_page.dart';
import './pages/edit_product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MyAuth(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
      ],
      builder: (context, child) => Consumer<MyAuth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: auth.isAuth ? HomePage() : LoginPage(),
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            EditProductPage.route: (ctx) => EditProductPage(),
          },
        ),
      ),
    );
  }
}
