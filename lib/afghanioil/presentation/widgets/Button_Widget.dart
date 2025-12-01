import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:flutter/material.dart';

import '../../../uitl/AppColor.dart';
import '../../../uitl/AppString.dart';

defaultEventButton({
  required String txt,
  required onPressed,
  Color color=Colors.white
})=>Flexible(
  child: ElevatedButton(
    onPressed:onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      foregroundColor: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    child: defaultSmailText(txt: txt,color: Appcolor.colorblack),
  ),
);