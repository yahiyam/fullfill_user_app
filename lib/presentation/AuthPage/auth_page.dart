import 'package:flutter/material.dart';
import 'tabs/login_form.dart';
import 'tabs/sign_up_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: screen.height / 3,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/icon.png'),
                  ),
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                bottom: const TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Color(0xfffa4a0c),
                  splashFactory: NoSplash.splashFactory,
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                  isScrollable: true,
                  tabs: [
                    Tab(text: "Login"),
                    Tab(text: "Sign-up"),
                  ],
                ),
              )
            ];
          },
          body:  const TabBarView(
            children: [
              LoginForm(),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
