import 'package:flutter/material.dart';
import 'package:shopping/app/app_module.dart';
import 'package:shopping/app/blocs/theme_bloc.dart';
import 'package:shopping/app/settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _bloc = AppModule.to.getBloc<ThemeBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          StreamBuilder<String>(
              stream: _bloc.outStringTheme,
              initialData: Settings.theme,
              builder: (context, snapshot) {
                return Text(
                  'Teme Atual: ${snapshot.data}',
                  textAlign: TextAlign.center,
                );
              }),
          FlatButton(
            child: Text('Light'),
            onPressed: () {
              _bloc.change('light');
            },
          ),
          FlatButton(
            child: Text('Dark'),
            onPressed: () {
              _bloc.change('dark');
            },
          ),
          FlatButton(
            child: Text('Dark Yellow'),
            onPressed: () {
              _bloc.change('dark-yellow');
            },
          ),
        ],
      ),
    );
  }
}
