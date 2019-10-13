import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/blocs/user_bloc.dart';
import 'package:shopping/app/models/authenticate-user.model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Usuário Inválido';
                  else
                    return null;
                },
                onSaved: (v) => username = v,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Senha Inválido';
                  else
                    return null;
                },
                onSaved: (v) => password = v,
              ),
              FlatButton(
                child: Text('Entrar'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    authenticate(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  authenticate(BuildContext context) async {
    var bloc = AppModule.to.getBloc<UserBloc>();

    var user = await bloc.authenticate(
      AuthenticateUserModel(username: username, password: password),
    );

    if (user != null) {
      Navigator.pop(context);
      return;
    } else {
      final snackBar = SnackBar(
        content: Text('Usuário ou senha invalidos'),
      );
      _scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }
}
