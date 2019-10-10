import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/ui/android/pages/login_page.dart';
import 'package:shopping/ui/android/pages/signup_page.dart';

class UnauthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 60,
        ),
        FlatButton(
          child: Text('Autentique-se'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        FlatButton(
          child: Text('Ainda não sou cadastrado'),
          onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignupPage()));
          },
        ),
      ],
    );
  }
}
