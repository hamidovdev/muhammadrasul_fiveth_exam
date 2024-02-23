import 'package:firebase_core/firebase_core.dart';
import 'package:fiveth_month_exam/core/getIt/injector.dart';
import 'package:fiveth_month_exam/core/pages/splash.dart';
import 'package:fiveth_month_exam/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:fiveth_month_exam/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'assets/constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await getItInjector();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.txtStyles(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
