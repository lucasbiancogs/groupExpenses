import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Valor R\$',
                            style: TextStyle(fontSize: 35),
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _valueControler,
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}
