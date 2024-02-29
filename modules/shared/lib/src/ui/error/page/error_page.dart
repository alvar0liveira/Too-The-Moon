import 'package:flutter/material.dart';
import '../model/error_model.dart';

class ErrorPage extends StatelessWidget {
  final ErrorModel error = ErrorModel();

  // const ErrorPage({Key? key, required this.error}) : super(key: key);
  ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              error.title,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              error.body,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
