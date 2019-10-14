import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/shared/blocs/user_bloc.dart';
import 'package:shopping/app/models/user.model.dart';

class AuthenticatedUserCardWidget extends StatelessWidget {
  var bloc = AppModule.to.getBloc<UserBloc>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
        stream: bloc.outUser,
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.black),
                ),
              ),
            );

          var user = snapshot.data;
          return Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(user?.image ?? ''),
                        ),
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                          width: 4,
                          color: const Color(0xFFFFFFFF),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(200))),
                  ),
                  Text('Bem-vindo, ${user?.name}'),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                    child: Text('sair'),
                    onPressed: () {
                      bloc.logout();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
