import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import '../providers/auth.dart';
import '../providers/group.dart';

class TransactionForm extends StatefulWidget {
  final Group group;

  const TransactionForm(this.group);
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  final _valueControler = MoneyMaskedTextController(decimalSeparator: ',');

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context);
    return Container(
      width: double.infinity,
      height: 300 + MediaQuery.of(context).viewInsets.bottom,
      margin: EdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Nova Transação'),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Form(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(widget.group.name, style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.headline2.color,
                            fontSize: 15,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline2.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
