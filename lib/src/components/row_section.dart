import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:cyney/src/utils/app_color.dart';
import 'package:cyney/src/utils/styles.dart';
import 'package:flutter/material.dart';

class RowSection extends StatelessWidget {
  final String title;
  final Function ontap;

  const RowSection({
    Key key,
    @required this.title,
    @required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0) +
          EdgeInsets.only(top: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          BouncingWidget(
            scaleFactor: 0.2,
            onPressed: ontap,
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: FontSizes.s12,
                color: red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
