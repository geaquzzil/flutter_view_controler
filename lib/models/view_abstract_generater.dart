import 'package:flutter/material.dart';

import 'view_abstract_api.dart';

abstract class ViewAbstractGenerator<T> extends ViewAbstractApi<T> {
  Card getCardListView(BuildContext context) {
    return Card(
      child: ListTile(
        title: (getHeaderText(context)),
        subtitle: (getSubtitleHeaderText(context)),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: getCardLeadingImage(context),
        ),
        // trailing: getTrailing(context),
      ),
    );
  }

  void onDrawerItemClicked(BuildContext context) {
    //Navigator.of(context).pop();

    print('onDrawerItemClicked=> ${getHeaderText(context)?.data}');
  }

  ListTile getDrawerListTitle(BuildContext context) {
    return ListTile(
      subtitle: const Text('tst'),
      leading: getIcon(context),
      title: getHeaderText(context),
      onTap: () => onDrawerItemClicked(context),
    );
  }

  // for adding drawer headers
  //  const DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: Colors.blue,
  //             ),
  //             child: Text('Drawer Header'),
  //           ),
}
