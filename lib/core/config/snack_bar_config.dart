
  
  import 'package:flutter/material.dart';
import 'package:to_do_list_app/core/constant/app_colors.dart';
import 'package:to_do_list_app/core/enum/snack_bar.dart';

import 'package:to_do_list_app/model/snack_bar.dart';

class SnackBarConfig {
    static SnackBarModel configFor(SnackBarType type) {
    switch (type) {
      case SnackBarType.success:
        return SnackBarModel(AppColors.success, Icons.check_circle_rounded);
      case SnackBarType.error:
        return SnackBarModel(AppColors.error, Icons.error_rounded);
      case SnackBarType.warning:
        return SnackBarModel(AppColors.warning, Icons.warning_rounded);
      case SnackBarType.info:
        return SnackBarModel(AppColors.primary, Icons.info_rounded);
    }
  }
  }