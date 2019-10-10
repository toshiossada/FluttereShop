import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/theme.bloc.dart';
import 'package:shopping/settings.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            'Teme Atual: ${Settings.theme}',
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Light'),
            onPressed: (){
              bloc.change('light');
            },
          ),
          FlatButton(
            child: Text('Dark'),
            onPressed: (){
              bloc.change('dark');
            },
          ),
          FlatButton(
            child: Text('Dark Yellow'),
            onPressed: (){
              bloc.change('dark-yellow');
            },
          ),
        ],
      ),
    );
  }
}
