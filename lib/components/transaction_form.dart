import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../providers/auth.dart';

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  final _valueControler = MoneyMaskedTextController(decimalSeparator: ',');

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Container(
      width: double.infinity,
      height: 500,
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova Transação'),
          automaticallyImplyLeading: false,
        ),
        body: Form(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Valor R\$',
                      style: TextStyle(fontSize: 35),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 180,
                      child: TextFormField(
                        style: TextStyle(fontSize: 35),
                        keyboardType: TextInputType.number,
                        controller: _valueControler,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Grupo ', style: TextStyle(fontSize: 20)),
                    Text(auth.groups[0].name, style: TextStyle(fontSize: 20)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
