import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import '../core/themes/themes.dart';

class DialogUtils {
  static CancelFunc? _cancelFunc;

  static void showLoadingDialog({required bool isShow, bool clickClose = false, bool allowClick = false}) {
    if (_cancelFunc != null) {
      _cancelFunc!();
      _cancelFunc = null;
    }
    if (isShow) {
      _cancelFunc = BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => Container(
          color: Colors.transparent,
          width: 50,
          height: 50,
          child: const CircularProgressIndicator(
            // strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green2E),
          ),
        ),
        clickClose: clickClose,
        allowClick: allowClick,
      );
    }
  }
}
