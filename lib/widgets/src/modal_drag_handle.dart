import 'package:flutter/material.dart';
import 'package:givtimer/utils/utils.dart';

class BuildModalDragHandle extends StatelessWidget {
  const BuildModalDragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSpace(10),
        Center(
          child: Container(
            height: 6,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: Colors.grey[400],
            ),
          ),
        ),
        const VSpace(20),
      ],
    );
  }
}
