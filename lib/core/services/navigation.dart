import 'package:flutter/material.dart';

class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<T?> push<T extends Object>(Route<T> route) {
    return navigatorKey.currentState!.push(route);
  }

  Future<T?> pushNamed<T extends Object>(String routeName,
      {Object? arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<T?> replace<T extends Object, TO extends Object>(Route<T> newRoute) {
    return navigatorKey.currentState!.pushReplacement(newRoute);
  }

  Future<T?> replaceNamed<T extends Object, TO extends Object>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, result: result, arguments: arguments);
  }

  void pop<T extends Object>([T? result]) {
    navigatorKey.currentState!.pop(result);
  }

  void popToNamed(String routeName) {
    navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  void popUntil(RoutePredicate predicate) {
    navigatorKey.currentState!.popUntil(predicate);
  }

  Future<T?> pushAndRemoveUntil<T extends Object>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) {
    return navigatorKey.currentState!.pushAndRemoveUntil(newRoute, predicate);
  }

  void popToRoot() {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  BuildContext? getCurrentContext() {
    return navigatorKey.currentContext;
  }

  bool canPop() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  // Custom navigation methods with animations
  Future<T?> pushWithCustomTransition<T extends Object>(
      Widget page, RouteTransitionsBuilder transitionsBuilder,
      {Duration duration = const Duration(milliseconds: 300)}) {
    return push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionDuration: duration,
        transitionsBuilder: transitionsBuilder,
      ),
    );
  }

  Future<T?> pushWithFadeTransition<T extends Object>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return pushWithCustomTransition(
      page,
      (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
      duration: duration,
    );
  }

  Future<T?> pushWithScaleTransition<T extends Object>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) {
    return pushWithCustomTransition(
      page,
      (context, animation, secondaryAnimation, child) => ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: curve),
        child: child,
      ),
      duration: duration,
    );
  }

  Future<T?> pushWithRotationTransition<T extends Object>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) {
    return pushWithCustomTransition(
      page,
      (context, animation, secondaryAnimation, child) => RotationTransition(
        turns: animation,
        child: child,
      ),
      duration: duration,
    );
  }

  Future<T?> pushWithSizeTransition<T extends Object>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.ease,
  }) {
    return pushWithCustomTransition(
      page,
      (context, animation, secondaryAnimation, child) => Align(
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      ),
      duration: duration,
    );
  }

  // Utility function to create a slide transition, used internally
  Route<T> _createSlideTransition<T>(
    Widget page,
    Duration duration,
    AxisDirection direction,
  ) {
    return PageRouteBuilder<T>(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var beginOffset = Offset(0.0, 1.0);
        switch (direction) {
          case AxisDirection.up:
            beginOffset = Offset(0.0, 1.0);
            break;
          case AxisDirection.down:
            beginOffset = Offset(0.0, -1.0);
            break;
          case AxisDirection.right:
            beginOffset = Offset(1.0, 0.0);
            break;
          case AxisDirection.left:
            beginOffset = Offset(-1.0, 0.0);
            break;
        }

        var tween = Tween(begin: beginOffset, end: Offset.zero)
            .chain(CurveTween(curve: Curves.easeInOut));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  // Public method to push a new route with a slide transition
  Future<T?> pushWithSlideTransition<T extends Object>(
    Widget page, {
    Duration duration = const Duration(milliseconds: 300),
    AxisDirection direction = AxisDirection.right,
  }) {
    return push<T>(_createSlideTransition(page, duration, direction));
  }
}
