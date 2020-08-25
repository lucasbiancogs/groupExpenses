import 'dart:convert';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groupExpenses/utils/app_routes.dart';
import 'package:http/http.dart' as http;
import '../data/store.dart';

import 'group.dart';
import 'transaction.dart';
import '../utils/constants.dart';

class Auth with ChangeNotifier {
  static const _signinUrl = Constants.BASE_AUTH_SIGNIN_URL;
  static const _signupUrl = Constants.BASE_AUTH_SIGNUP_URL;
  static const _baseUrl = Constants.BASE_API_URL;

  String _token;
  DateTime _expiryDate;
  Timer _logoutTimer;
  String _userId;
  String name;
  List<Transaction> transactions = [];
  List<String> groupsId = [];
  List<Group> groups = [];
  bool _isAuth = false;

  bool get isAuth {
    // Dar uma revisada nesse métodos
    return token != null ? _isAuth : false;
  }

  String get userId {
    return isAuth ? _userId : null;
  }

  String get token {
    if (_token != null &&
        _expiryDate != null &&
        _expiryDate.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> _authenticate(String email, String password, String url) async {
    final response = await http.post(
      url,
      body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true}),
    );

    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      print('Erro');
      return null;
    } else {
      _token = responseBody['idToken'];
      _userId = responseBody['localId'];
      _expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(responseBody['expiresIn'])),
      );

      Store.saveMap('userData', {
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String(),
      });

      _autoLogout();
      notifyListeners();
    }

    return Future.value();
  }

  Future<void> loadAuthenticatedUser() async {
    this.name = null;
    this.transactions = [];
    this.groupsId = [];
    print('Carregando usuário autenticado $userId ...');
    final response = await http.get('$_baseUrl/users/$userId.json');
    final Map<String, dynamic> data = json.decode(response.body);
    this.name = data['name'];
    print('Auth user name: $name');

    final List<dynamic> transactionsData =
        data['transactions'] as List<dynamic>;
    transactionsData.forEach((transactionData) {
      transactions.add(Transaction(
        transactionId: Random().nextDouble().toString(),
        value: transactionData['value'],
        groupId: transactionData['groupId'],
      ));
    });
    print('Total de ${transactions.length} transações.');
    transactions.forEach((transaction) {
      print('TransactionId: ${transaction.transactionId}');
      print('Value: ${transaction.value}');
      print('GroupId: ${transaction.groupId}');
    });

    final List<dynamic> groupsIdData = data['groupsId'] as List<dynamic>;
    final groupsId = groupsIdData.map((groupId) => groupId.toString()).toList();
    this.groupsId = groupsId;
    print('Auth GroupsId: $groupsId');

    print('Usuário autenticado carregado.');
    return Future.value();
  }

  Future<void> loadGroups() async {
    groups = [];
    groupsId.forEach((groupId) async {
      groups.add(Group(groupId));
    });
    print('Carregando ${groups.length} grupo(s)...');
    await Future.forEach(groups, (Group group) async {
      /*
      Existe um problema com o forEach para carregar múltiplos Futures
      pois ele não retorna um Future
      por isso deve-se usar o Future.forEach....
      */
      await group.loadGroup();
      return Future.value();
    });
    return Future.value();
  }

  Future<void> login(String email, String password) async {
    await _authenticate(email, password, _signinUrl);
    await loadAuthenticatedUser();
    await loadGroups();

    _isAuth = true;

    notifyListeners();
    return Future.value();
  }

  void logout() {
    this._token = null;
    this._userId = null;
    this.name = null;
    this.groupsId = [];
    this.groups = [];
    this._isAuth = false;

    notifyListeners();
  }

  Future<void> signup(String email, String password, String name) async {
    await _authenticate(email, password, _signupUrl);
    await http.post('$_baseUrl/users/$userId.json',
        body: json.encode({
          'name': name,
        }));

    _isAuth = true;

    return Future.value();
  }

  String groupName(String groupId) {
    String groupName = '';
    groups.forEach((group) {
      if (group.groupId == groupId) groupName = group.name;
    });
    return groupName;
  }

  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
    }
    final timeToLogout = _expiryDate.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }

  // Esse método tem que sair daqui e ir para group
  Future<void> addGroup() async {
    final response = await http.post(
        'https://groupexpenses-lucasbianco.firebaseio.com/groups.json',
        body: json.encode({
          'name': 'Loja',
          'usersId': [
            '-MFNNXKUcVSI0Ob0iHZK',
            '-MFVEnxWFtB4BkBfefpv',
          ].map((u) => u).toList(),
        }));
  }
}
