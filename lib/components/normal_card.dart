import 'package:flutter/material.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';

class NormalCard<T extends ViewAbstract> extends StatelessWidget {
  final T object;
  const NormalCard({
    Key? key,
    required this.object,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => object.onCardClicked(context),
      child: Card(
        child: ListTile(
          title: (object.getHeaderText(context)),
          subtitle: (object.getSubtitleHeaderText(context)),
          leading: object.getCardLeading(context),
          // trailing: getTrailing(context),
        ),
      ),
    );
  }
}
