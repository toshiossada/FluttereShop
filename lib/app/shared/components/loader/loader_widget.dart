import 'package:flutter/material.dart';
import 'package:shopping/app/shared/components/progress_indicator/progress_indicator_widget.dart';

class LoaderWidget extends StatelessWidget {
  final object;
  final Function callback;

  LoaderWidget({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: GenericProgressIndicator(),
      );
    else if (object.length == 0)
      return Center(
        child: Text('Nenhum item encontrado!'),
      );
    else
      return callback();
  }
}
