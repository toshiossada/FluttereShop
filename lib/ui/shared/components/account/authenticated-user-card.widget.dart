import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/models/authenticate-user.model.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);


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
                    image: NetworkImage(bloc.user?.image ?? ''),
                  ),
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 4,
                    color: const Color(0xFFFFFFFF),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(200))),
            ),
            Text('Bem-vindo, ${bloc.user?.name}'),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              child: Text('sair'),
              onPressed: (){
                bloc.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
