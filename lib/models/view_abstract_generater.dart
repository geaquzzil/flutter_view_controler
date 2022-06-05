import 'package:flutter/material.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';
import 'package:flutter_view_controller/screens/action_screens/view_details_page.dart';

import 'view_abstract_api.dart';

abstract class ViewAbstractGenerator<T> extends ViewAbstractApi<T> {
  void onCardClicked(BuildContext context) {
    print("Card Clicked");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewDetailsPage(
          object: this as ViewAbstract,
        ),
      ),
    );
  }

  Widget getCardListView(BuildContext context) {
    return InkWell(
      onTap: () => onCardClicked(context),
      child: Card(
        child: ListTile(
          title: (getHeaderText(context)),
          subtitle: (getSubtitleHeaderText(context)),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: getCardLeadingImage(context),
          ),
          // trailing: getTrailing(context),
        ),
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
