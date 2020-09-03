import 'package:flutter/material.dart';

enum GroupFormMode {
  NewGroup,
  ExistingGroup,
}

class GroupCard extends StatefulWidget {
  @override
  _GroupCardState createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  GroupFormMode _groupFormMode = GroupFormMode.NewGroup;

  final Map<String, String> _formData = {
    'name': '',
    // 'description': '',
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('Card'),
    );
  }
}
