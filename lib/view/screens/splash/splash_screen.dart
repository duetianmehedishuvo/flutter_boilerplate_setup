import 'package:flutter/material.dart';
import 'package:nahid_ecommerce/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Provider.of<AuthProvider>(context,listen: false).getDayOneData();

    return Container();
  }
}
