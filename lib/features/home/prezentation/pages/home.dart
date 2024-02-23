import 'package:firebase_auth/firebase_auth.dart';
import 'package:fiveth_month_exam/assets/constants/colors.dart';
import 'package:fiveth_month_exam/assets/constants/icons.dart';
import 'package:fiveth_month_exam/core/getIt/injector.dart';
import 'package:fiveth_month_exam/features/authentication/domain/entity/auth_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  final AuthEntity user;
  const HomeScreen({super.key, required this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fb = injc<FirebaseAuth>();
  @override
  Widget build(BuildContext context) {
    print("User datasi ===> ${fb.currentUser}");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Profil",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: whitish,
                )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 82,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  widget.user.avatarimg.isNotEmpty
                      ? Image.network(widget.user.avatarimg)
                      : Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: const Icon(
                            Icons.data_usage_rounded,
                            size: 50,
                          ),
                        ),
                  const Gap(12),
                  SizedBox(
                    width: 198,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${fb.currentUser!.displayName != null ? fb.currentUser!.displayName : "Jasur Jaxongirov"}",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: blackish,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const Gap(4),
                        Text(
                          "${fb.currentUser!.email}",
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: greyish, fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  // final fb = injc<FirebaseAuth>();
                  // fb.currentUser!.delete();
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     CupertinoPageRoute(
                  //         builder: (context) => const LoginScreen()),
                  //     (route) => false);
                },
                child: SvgPicture.asset(AppIcons.back),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
