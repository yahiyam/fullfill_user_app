import 'package:flutter/material.dart';
import 'package:user_app/constants/colors.dart';
import 'package:user_app/features/view/auth/widgets/auth_flexible_space.dart';
import 'package:user_app/features/view_model/auth/auth_page_tabs_provider.dart';
import 'package:user_app/utils/screen_size.dart';
import 'package:provider/provider.dart';
import 'tabs/login_form.dart';
import 'tabs/sign_up_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<AuthTabsProvider>(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: Screen.height(30),
                flexibleSpace: const AuthFlexibleSpaceBar(),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                bottom: TabBar(
                  labelColor: black,
                  indicatorColor: commonColor,
                  splashFactory: NoSplash.splashFactory,
                  labelStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 15,
                  ),
                  isScrollable: true,
                  controller: tabProvider.tabController,
                  tabs: const [
                    Tab(text: "Login"),
                    Tab(text: "Sign-up"),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(
            controller: tabProvider.tabController,
            children: const [
              LoginForm(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
