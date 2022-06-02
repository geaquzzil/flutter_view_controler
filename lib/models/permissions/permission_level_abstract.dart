import 'package:flutter_view_controller/models/permissions/permission_action_abstract.dart';
import 'package:collection/collection.dart';
import '../view_abstract.dart';

abstract class PermissionLevelAbstract
    extends ViewAbstract<PermissionLevelAbstract> {
  String? userlevelname;

  static Map<String, PermissionActionAbstract> hashMapOfPermissionTableAction =
      {};
  List<PermissionActionAbstract>? permissions_levels;
  PermissionLevelAbstract() {
    userlevelname = '-';
    permissions_levels = List<PermissionActionAbstract>.empty();
  }

  static bool containsStaticKey(String key) {
    return hashMapOfPermissionTableAction.containsKey(key);
  }

  static PermissionActionAbstract? containsStaticKeyReturnValue(String key) {
    return hashMapOfPermissionTableAction[key];
  }

  PermissionActionAbstract? findCurrentPermission(dynamic toDo) {
    PermissionActionAbstract? foundedPermission;
    String? currentTableNameFromObject = findCurrentTableNmeFromObject(toDo);
    if ((currentTableNameFromObject == null)) return null;
    if (containsStaticKey(currentTableNameFromObject)) {
      return containsStaticKeyReturnValue(currentTableNameFromObject);
    }
    foundedPermission = permissions_levels?.firstWhereOrNull((o) =>
        o.table_name != null && o.table_name == currentTableNameFromObject);
    if (foundedPermission != null) {
      hashMapOfPermissionTableAction[currentTableNameFromObject] =
          foundedPermission;
    }
    return foundedPermission;
  }

  String? getTableName(dynamic toDo) {
    if (toDo is! ViewAbstract) {
      return null;
    }
    ViewAbstract viewAbstract = toDo;
    return viewAbstract.getTableNameApi() ?? getCustomAction();
  }

  String? findCurrentTableNmeFromObject(dynamic toDo) {
    if (toDo is String) {
      return toDo.toString();
    } else {
      return getTableName(toDo);
    }
  }

  bool isAdmin();

  bool isGuest();

  bool isGeneralClient();

  bool isGeneralEmployee();
}
