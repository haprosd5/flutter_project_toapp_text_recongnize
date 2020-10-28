import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projecttodoapp/blocs/todo_bloc/todo_bloc.dart';
import 'package:projecttodoapp/codes/sevices/todo_service.dart';
import 'package:projecttodoapp/helper/constants.dart';

import 'codes/dbs/database.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      db: await $FloorAppDatabase.databaseBuilder('app_database.db').build(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key, this.db}) : super(key: key);
  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TodoBloc(TodoService(db: this.db))),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryMainColor,
            primaryColor: kPrimaryMainColor,
            accentColor: kAccendMainColor,
            appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.white,
              brightness: Brightness.light,
              actionsIconTheme: IconThemeData(color: kTextPrimarySubColor),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ));
  }
}
