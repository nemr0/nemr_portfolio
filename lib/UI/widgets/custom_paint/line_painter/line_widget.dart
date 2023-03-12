import 'package:flutter/cupertino.dart';

import 'line_types.dart';
import 'line_painter.dart';

/// advanced line can be in any 2d axis, solid or dashed line.
class AdvancedLine extends StatelessWidget {
  /// axis of line
  final Axis direction;

  /// type of line
  /// can be [DashedLine], [SolidLine]
  final Line line;

  /// Paint Preferences to give color stroke width and more
  final Paint? paintDef;
  // Advanced Line Contstructor
  const AdvancedLine({
    super.key,
    required this.direction,
    required this.line,
    this.paintDef,
  });

  @override
  Widget build(BuildContext context) {
    // line painter, always rendering horizontal line
    // if requested axis is vertical
    // send horizontal line with 90 degree rotated

    Paint paint = paintDef ?? Paint();

    Row lineWrapper = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: paint.strokeWidth,
            child: CustomPaint(
              painter: LinePainter(line: line, paintDef: paint),
            ),
          ),
        ),
      ],
    );

    if (direction == Axis.horizontal) {
      /// Horizontal Line
      return lineWrapper;
    } else {
      /// Vertical Line
      return RotatedBox(
        quarterTurns: 1,
        child: lineWrapper,
      );
    }
  }
}
