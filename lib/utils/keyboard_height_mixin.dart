import 'dart:async';

import 'package:flutter/material.dart';

mixin KeyboardHeight<T extends StatefulWidget>
    on State<T>, WidgetsBindingObserver {
  final WidgetsBinding _widgetsBinding = WidgetsBinding.instance;
  late Timer timer;

  @override
  void initState() {
    _widgetsBinding.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final viewInsets = EdgeInsets.fromViewPadding(
        WidgetsBinding.instance.platformDispatcher.views.first.viewInsets,
        WidgetsBinding
            .instance.platformDispatcher.views.first.devicePixelRatio);
    try {
      timer.cancel();
    } catch (_) {
      timer = Timer(const Duration(milliseconds: 32), () {
        keyboardHeight(viewInsets.bottom);
      });
    }
  }

  void keyboardHeight(double height) {}

  @override
  void dispose() {
    _widgetsBinding.removeObserver(this);
    super.dispose();
  }
}
