import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

enum AuthMode {
  Signup,
  Login,
}

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  // É preciso para verificar no Signup se as senhas batem
  final _passwordControler = TextEditingController();

  Future<void> _submit() async {
    if (!_form.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    Auth auth = Provider.of<Auth>(context, listen: false);

    try {
      if (_authMode == AuthMode.Login) {
        await auth.login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        await auth.signup(
          _authData['email'],
          _authData['password'],
          _authData['name'],
        );
      }
    } catch (err) {
      print(err);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          height: _authMode == AuthMode.Login ? 330 : 420,
          width: deviceSize.width * 0.8,
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: 'Nome',
                    ),
                    validator: (value) {
                      if (value.isEmpty || value.length < 2) {
                        return 'Insira um usuário válido';
                      }
                      return null;
                    },
                  ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'E-mail',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Informe um e-mail válido';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['email'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.vpn_key),
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                  controller: _passwordControler,
                  validator: (value) {
                    if (value.isEmpty || value.length < 6) {
                      return 'Informe uma senha válida de ao menos 8 caractéres.';
                    }
                    return null;
                  },
                  onSaved: (value) => _authData['password'] = value,
                ),
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Confirmar Senha',
                      icon: Icon(Icons.check),
                    ),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordControler.text) {
                              return 'As senhas são diferentes';
                            }
                            return null;
                          }
                        : null,
                  ),
                  SizedBox(height: 30),
                if (_isLoading)
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                    ),
                  )
                else
                  Column(children: [
                      if (_authMode == AuthMode.Login)
                        FlatButton(
                          onPressed: () {
                            // Vai enviar uma nova senha
                          },
                          child: Text('Esqueci minha senha.'),
                        ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          _authMode == AuthMode.Login ? 'ENTRAR' : 'REGISTRAR',
                        ),
                        onPressed: _submit,
                      ),
                      FlatButton(
                        onPressed: _switchAuthMode,
                        child: Text(_authMode == AuthMode.Login
                            ? 'Não possuo um cadastro.'
                            : 'Já possuo cadastro.'),
                      ),
                    ],
                  )
              ],
            ),
          )),
    );
  }
}
