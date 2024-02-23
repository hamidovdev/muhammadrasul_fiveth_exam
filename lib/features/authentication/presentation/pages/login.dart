import 'package:fiveth_month_exam/assets/constants/colors.dart';
import 'package:fiveth_month_exam/assets/constants/icons.dart';
import 'package:fiveth_month_exam/core/status/auth_status.dart';
import 'package:fiveth_month_exam/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:fiveth_month_exam/features/home/prezentation/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isDisabled = false;
  @override
  void initState() {
    emailController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isDisabled) {
          setState(() {
            isDisabled = true;
          });
        }
      } else {
        if (isDisabled) {
          setState(() {
            isDisabled = false;
          });
        }
      }
    });

    passwordController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isDisabled) {
          setState(() {
            isDisabled = true;
          });
        }
      } else {
        if (isDisabled) {
          setState(() {
            isDisabled = false;
          });
        }
      }
    });
    super.initState();
  }

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        suffixStyle: const TextStyle(color: whitish),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle:
            Theme.of(context).textTheme.bodySmall!.copyWith(color: whitish),
        fillColor: blabla,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: blabla.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: blabla.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: blabla.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          switch (state.status) {
            case AuthStatus.unAuthenticated:
              return Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top + 67),
                      child: Image.asset(AppIcons.logo),
                    ),
                    const Gap(44),
                    TextFormField(
                      onChanged: (value) {
                        emailController.text = value;
                      },
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: whitish),
                      cursorColor: blush,
                      controller: emailController,
                      decoration: decoration(hintText: 'Email'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, mail kiriting!';
                        } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Iltimos, yaroqli mail manzilini kiriting';
                        }

                        return null;
                      },
                    ),
                    const Gap(16),
                    TextFormField(
                      onChanged: (value) {
                        passwordController.text = value;
                      },
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: whitish),
                      cursorColor: blush,
                      controller: passwordController,
                      decoration: decoration(
                          hintText: 'Password',
                          suffixIcon: SvgPicture.asset(
                            AppIcons.password,
                          )),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Iltimos, parolingizni kiriting!';
                        } else if (value.length < 7) {
                          return 'Parol eng kamida 8ta belgidan tashkil topgan bo\'lishi kerak';
                        }

                        return null;
                      },
                    ),
                    const Gap(12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: blush),
                      ),
                    ),
                    const Gap(26),
                    GestureDetector(
                      onTap: () async {
                        context.read<AuthenticationBloc>().add(
                              SignInEvent(
                                email: emailController.text,
                                password: passwordController.text,
                                failure: () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                          content: Center(
                                    child: Text("User mavjud emas"),
                                  )));
                                },
                                success: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      CupertinoPageRoute(
                                          builder: (context) => HomeScreen(
                                                user: state.user,
                                              )),
                                      (route) => false);
                                },
                              ),
                            );
                      },
                      child: Container(
                          height: 48,
                          width: 384,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                                  horizontal: 152, vertical: 13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isDisabled == false
                                ? blush.withOpacity(0.2)
                                : blush,
                          ),
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: isDisabled == false
                                        ? whitish.withOpacity(0.2)
                                        : whitish),
                          )),
                    ),
                  ]),
                ),
              );
            case AuthStatus.loading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
