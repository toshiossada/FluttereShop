import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/shared/blocs/user_bloc.dart';
import 'package:shopping/app/ui/android/pages/login/login_page.dart';
import 'package:shopping/app/ui/android/pages/signup/signup_page.dart';

class UnauthenticatedUserCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   var bloc = AppModule.to.getBloc<UserBloc>();

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
