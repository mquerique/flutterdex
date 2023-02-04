import 'package:flutter/material.dart';
import 'package:flutterdex/core/localization/app_localization.dart';

class Validators {
  static String? nullOrEmptyValidator({
    required BuildContext context,
    String? val,
  }) {
    if (val == null || val.isEmpty) {
      return AppLocalization.of(context).tr('err_field_required');
    }
    return null;
  }
}
