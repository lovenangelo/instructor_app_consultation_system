import 'package:consultation_system/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/text_widget.dart';

// ignore: must_be_immutable
class DropDownItem extends StatelessWidget {
  late String label;

  DropDownItem({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(children: [
      NormalText(color: primary, fontSize: 12, label: label),
    ]));
  }
}
