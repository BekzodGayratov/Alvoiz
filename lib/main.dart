import 'package:alvoiz/config/theme.dart';
import 'package:alvoiz/routes/router.dart';
import 'package:alvoiz/view/presentation/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AlvoizThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouterGenerator.router.onGenerate,
    );
  }
}
