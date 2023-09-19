import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stratagile_machine_test/application/home/local_db_provider.dart';
import 'package:stratagile_machine_test/presentation/home/home_screen.dart';

import 'core/constents.dart';
import 'infrastructure/home/sql_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlHelper.initDb();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LocalDBProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Stratagile_machine_test',
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: Constants.messengerKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
