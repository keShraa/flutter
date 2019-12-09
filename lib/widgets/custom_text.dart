import 'package:flutter/material.dart';

class CustomText extends Text {

  CustomText(String data, {color: Colors.white, textAlign: TextAlign.center, factor: 1.0, weight: FontWeight.normal}):
      super(data,
          textAlign: textAlign,
          textScaleFactor: factor,
          style: new TextStyle(color: color, fontWeight: weight)
      );

}