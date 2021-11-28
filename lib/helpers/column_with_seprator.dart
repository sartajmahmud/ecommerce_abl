import 'package:flutter/material.dart';

List<Widget> getChildrenWithSeparator(
    {List<Widget> widgets, Widget separator, bool addToLastChild = true}) {
  List<Widget> children = [];
  if (widgets.length > 0) {
    children.add(separator);

    for (int i = 0; i < widgets.length; i++) {
      children.add(widgets[i]);

      if (widgets.length - i == 1) {
        if (addToLastChild) {
          children.add(separator);
        }
      } else {
        children.add(separator);
      }
    }
  }
  return children;
}
