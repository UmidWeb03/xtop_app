import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xtop_app/core/routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up Screen',
                style: TextStyle(fontSize: 24),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go(AppRoutes.home);
                },
                child: Text('Go to Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
