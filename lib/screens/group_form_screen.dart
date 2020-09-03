import 'package:flutter/material.dart';

import '../components/group_card.dart';

class GroupFormScreen extends StatelessWidget {
  final PreferredSizeWidget appBar = AppBar(
    elevation: 0.0,
    title: Text('Adicionar Grupo'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.4 -
                      appBar.preferredSize.height,
                  color: Theme.of(context).primaryColor,
                ),
                // Colocar outros tipos de autenticação e opção de signup
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 140),
              child: GroupCard(),
            ),
          ],
        ));
  }
}
