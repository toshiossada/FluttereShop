import 'package:flutter/widgets.dart';
import 'package:shopping/ui/shared/components/shared/progress-indicator.widget.dart';

class Loader extends StatelessWidget {
  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

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
