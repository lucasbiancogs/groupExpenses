import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../components/auth_card.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Scaffold(
        body: Stack(
          alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                      right: 70,
                    ),
                    child: Text(
                      'Group Expenses',
                      style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Icon(
                      Icons.group,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // Colocar outros tipos de autenticação e opção de signup
          ],
        ),
        AuthCard(),
      ],
    ));
  }
}
