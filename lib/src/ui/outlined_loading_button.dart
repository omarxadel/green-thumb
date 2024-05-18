import 'package:flutter/material.dart';
import 'package:easy_loading_button/easy_loading_button.dart';

class OutlinedLoadingButton extends StatelessWidget {
  const OutlinedLoadingButton({super.key, this.onPressed, required this.child});

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      type: EasyButtonType.outlined,
      width: 200.0,
      height: 40.0,
      borderRadius: 100.0,
      buttonColor: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      idleStateWidget: child,
      loadingStateWidget: CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
      useWidthAnimation: true,
      useEqualLoadingStateWidgetDimension: true,
    );
  }
}
