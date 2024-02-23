import 'dart:async';

import 'package:fiveth_month_exam/assets/constants/icons.dart';
import 'package:fiveth_month_exam/core/status/auth_status.dart';
import 'package:fiveth_month_exam/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:fiveth_month_exam/features/authentication/presentation/pages/login.dart';
import 'package:fiveth_month_exam/features/home/prezentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthStatus.authenticated:
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(
                      builder: (context) => HomeScreen(
                            user: state.user,
                          )),
                  (route) => false);
            case AuthStatus.unAuthenticated:
              Navigator.of(context).pushAndRemoveUntil(
                  CupertinoPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false);
            default:
          }
        },
        builder: (context, state) {
          if (state.status == AuthStatus.pure) {
            Timer(
              Duration(seconds: 2),
              () {
                context.read<AuthenticationBloc>().add(GetFireBaseUser());
              },
            );
          }
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 40),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Column(
                    children: [
                      Image.asset(AppIcons.logo),
                      Gap(12),
                      Text(
                        "Productive",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const CupertinoActivityIndicator(radius: 12,),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}
