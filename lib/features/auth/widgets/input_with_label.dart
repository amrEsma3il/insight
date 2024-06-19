


import 'package:flutter/material.dart';
import 'package:insight/core/const.dart';

import 'custom_text_field.dart';
import 'custom_text_style.dart';

class InputFieldWithLabel extends StatelessWidget {
final int? maxLines;
 final String label,hint;
 final double height,width;
 final Widget ? suffix,prefix;
 final double? paddingBottom,paddingTop;
   const InputFieldWithLabel({
    this.maxLines=1,
    super.key, required this.label, required this.hint,  this.height=46,this.width=343, this.prefix ,this.suffix, this.paddingBottom=9, this.paddingTop=0
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Text(
           label,
            style:font16WhiteSemiBold.copyWith(color: Colors.black.withOpacity(0.6)),
          ),
        ),
         SizedBox(
          height: 8 ,
                 ),
        Padding(
          padding:  EdgeInsets.only(bottom: 13 ),
          child: CustomTextField(
            prefixWidget: prefix,
            paddingBottom: paddingBottom! ,
            paddingTop: paddingTop! ,
            maxLines: maxLines,
            controller: TextEditingController(),
            onTap: () {},
            suffiWidget: suffix,
            width: width ,
            height: height ,
            hintText:hint,
          ),
        ),
      ],
    );
  }
}



