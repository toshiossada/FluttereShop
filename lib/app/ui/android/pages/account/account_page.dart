import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/shared/blocs/user_bloc.dart' as Shared;
import 'package:shopping/app/models/user.model.dart';
import 'package:shopping/app/ui/android/pages/settings/settings_page.dart';
import 'package:shopping/app/ui/shared/components/account/authenticated_user_card/authenticated_user_card_widget.dart';
import 'package:shopping/app/ui/shared/components/account/unauthenticated_user_card/unauthenticated_user_card_widget.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var bloc = AppModule.to.getBloc<Shared.UserBloc>();

    return StreamBuilder<UserModel>(
        stream: bloc.outUser,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                FlatButton(
                  child: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsPage()));
                  },
                ),
              ],
            ),
            body: snapshot.data != null
                ? AuthenticatedUserCardWidget()
                : UnauthenticatedUserCardWidget(),
          );
        });
  }
}
