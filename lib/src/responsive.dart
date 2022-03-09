import 'package:flutter/material.dart';
import './condition.dart';

class Responsive extends StatelessWidget {
  final Map<Condition, Widget> _conditions;

  Responsive({Key? key, required Condition condition, required Widget child})
      : _conditions = {condition: child},
        super(key: key);

  Responsive.condition(
      {Key? key, required Condition condition, required Widget child})
      : _conditions = {condition: child},
        super(key: key);

  const Responsive.conditions(this._conditions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? target;
    _conditions.forEach((Condition condition, Widget child) {
      if (condition.check(context)) {
        target = child;
      }
    });

    return Offstage(
      offstage: target == null,
      child: target,
    );
  }
}
