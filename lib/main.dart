import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_management/db/category/category_db.dart';
import 'package:money_management/model/category/category_model.dart';
import 'package:money_management/model/transaction/transactions_model.dart';

import 'screen/add_transactions/screen_add_transaction.dart';
import 'screen/home/screen_home.dart';


Future<void> main() async{
  final obj1=CategoryDB();
  final obj2=CategoryDB();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if(!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)){
    Hive.registerAdapter(CategoryTypeAdapter());
  }

  if(!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)){
    Hive.registerAdapter(CategoryModelAdapter());
  }

  if(!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)){
    Hive.registerAdapter(TransactionModelAdapter());
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home:  ScreenHome(),
      routes: {
        ScreenAddTransaction.routeName:(ctx) => const ScreenAddTransaction(),
      },
    );
  }
}