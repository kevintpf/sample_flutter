import 'package:flutter/material.dart';

enum _ButtonKind {
  primaryFilled,
  primaryText,
  secondaryText,
  errorText,
}

class ExpButton extends StatelessWidget {
  ExpButton.primaryFilled({
    required String title,
    super.key,
    this.onPressed,
  })  : _buttonKind = _ButtonKind.primaryFilled,
        child = Text(title);

  ExpButton.secondaryText({
    required String title,
    super.key,
    this.onPressed,
  })  : _buttonKind = _ButtonKind.secondaryText,
        child = Text(title, textAlign: TextAlign.center);

  ExpButton.errorText({
    required String title,
    super.key,
    this.onPressed,
  })  : _buttonKind = _ButtonKind.errorText,
        child = Text(title, textAlign: TextAlign.center);

  final VoidCallback? onPressed;
  final Widget child;
  final _ButtonKind _buttonKind;

  @override
  Widget build(BuildContext context) {
    return switch (_buttonKind) {
      _ButtonKind.primaryFilled => FilledButton(
          onPressed: onPressed,
          child: child,
        ),
      _ButtonKind.primaryText => TextButton(
          onPressed: onPressed,
          child: child,
        ),
      _ButtonKind.secondaryText => TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: onPressed,
          child: child,
        ),
      _ButtonKind.errorText => TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: onPressed,
          child: child,
        ),
    };
  }
}
