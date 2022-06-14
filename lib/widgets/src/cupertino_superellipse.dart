import 'dart:math';

import 'package:flutter/cupertino.dart';

class Point {
  const Point(this.x, this.y);
  final double x;
  final double y;

  @override
  String toString() => 'Point(x: $x, y: $y)';
}

class SuperEllipse extends ShapeBorder {
  const SuperEllipse({
    required this.radius,
    this.corners = const <bool>[true, true, true, true],
    this.side = BorderSide.none,
  });

  final BorderSide side;
  final double radius;
  final List<bool> corners;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  ShapeBorder scale(double t) {
    return SuperEllipse(
      side: side.scale(t),
      radius: radius,
      corners: corners,
    );
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _superEllipsePath(rect, radius, corners);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _superEllipsePath(rect, radius, corners);
  }

  static Path _superEllipsePath(Rect rect, double radius, List<bool> corners) {
    final wide = rect.width > rect.height;
    final centerX = rect.width ~/ 2;
    final centerY = rect.height ~/ 2;
    final a = centerX;
    final b = centerY;
    final delta = (a - b).abs();
    final points = <Point>[];
    final points2 = <Point>[];

    for (int i = min(a, b); i >= 0; i--) {
      final val = pow((i.toDouble() / min(a, b).toDouble()).abs(), radius);
      points.add(
        Point(
          i.toDouble(),
          min(a, b).toDouble() * pow(1 - val, 1 / radius),
        ),
      );
    }

    for (int i = min(a, b); i >= 0; i--) {
      final val = pow((i.toDouble() / min(a, b).toDouble()).abs(), radius);
      points2.add(
        Point(
          min(a, b).toDouble() * pow(1 - val, 1 / radius),
          i.toDouble(),
        ),
      );
    }

    // dev.log(points.toString());
    // dev.log("+++++++++++++++++++++++++++++");
    // dev.log(points2.toString());

    var middle = 0;
    var middle2 = 0;
    for (var j = 0; j < points.length; j++) {
      final val1 = points[j].y.toInt();
      final val2 = points2[points2.length - 1 - j].x.toInt();
      if (val1 == val2) {
        middle = j;
        middle2 = points2[j].x.toInt();
      }
    }

    final path = Path()
      ..moveTo(
        centerX + points2[middle2].x + (wide ? delta : 0),
        centerY - points2[middle2].y - (wide ? 0 : delta),
      );

    if (corners[3]) {
      for (var i = middle2; i > 0; i--) {
        path.lineTo(
          centerX + points2[i].x + (wide ? delta : 0),
          centerY - points2[i].y - (wide ? 0 : delta),
        );
      }
      for (var i = middle; i < points.length - 1; i++) {
        path.lineTo(
          centerX + points[i].x + (wide ? delta : 0),
          centerY - points[i].y - (wide ? 0 : delta),
        );
      }
    } else {
      path.lineTo(centerX.toDouble() + a, centerY.toDouble() - b);
    }

    if (corners[2]) {
      for (var i = points.length - 1; i > middle; i--) {
        path.lineTo(
          centerX - points[i].x - (wide ? delta : 0),
          centerY - points[i].y - (wide ? 0 : delta),
        );
      }
      for (var i = 1; i < middle2; i++) {
        path.lineTo(
          centerX - points2[i].x - (wide ? delta : 0),
          centerY - points2[i].y - (wide ? 0 : delta),
        );
      }
    } else {
      path.lineTo(centerX.toDouble() - a, centerY.toDouble() - b);
    }

    if (corners[1]) {
      for (var i = middle2; i > 0; i--) {
        path.lineTo(
          centerX - points2[i].x - (wide ? delta : 0),
          centerY + points2[i].y + (wide ? 0 : delta),
        );
      }
      for (var i = middle; i < points.length - 1; i++) {
        path.lineTo(
          centerX - points[i].x - (wide ? delta : 0),
          centerY + points[i].y + (wide ? 0 : delta),
        );
      }
    } else {
      path.lineTo(centerX.toDouble() - a, centerY.toDouble() + b);
    }

    if (corners[0]) {
      for (var i = points.length - 1; i > middle; i--) {
        path.lineTo(
          centerX + points[i].x + (wide ? delta : 0),
          centerY + points[i].y + (wide ? 0 : delta),
        );
      }
      for (var i = 1; i < middle2; i++) {
        path.lineTo(
          centerX + points2[i].x + (wide ? delta : 0),
          centerY + points2[i].y + (wide ? 0 : delta),
        );
      }
    } else {
      path.lineTo(centerX.toDouble() + a, centerY.toDouble() + b);
    }

    path.lineTo(
      centerX + points2[middle2].x + (wide ? delta : 0),
      centerY - points2[middle2].y - (wide ? 0 : delta),
    );
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final path = getOuterPath(rect, textDirection: textDirection);
    canvas.drawPath(path, side.toPaint());
  }
}
