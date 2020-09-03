import 'package:flutter/material.dart';

class GroupFormScreen extends StatefulWidget {
  @override
  _GroupFormScreenState createState() => _GroupFormScreenState();
}

class _GroupFormScreenState extends State<GroupFormScreen> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Grupo'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Novo Grupo'),
              onPressed: () {},
            ),
            SizedBox(height: 30),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('Grupo Existente'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
