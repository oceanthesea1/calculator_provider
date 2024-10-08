import 'package:calculator_provider/bangun_datar/bd_calculators.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_appbar.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_color.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_text_field.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_value_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RectanglePage extends StatefulWidget {
  const RectanglePage({super.key});

  @override
  State<RectanglePage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<RectanglePage> {
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();

  @override
  void dispose() {
    lengthController.dispose();
    widthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rectangleCalculator = Provider.of<RectangleCalculator>(context);
    return Scaffold(
      appBar: BDCalAppbar(
          backgroundColor: colorTransparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          toolbarHeight: 40),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.rectangle_outlined, 
              size: 200, 
            ),
            SizedBox(height: 30), 
            BDCalTextField(
              labelText: 'Length',
              isObsecure: false,
              textStyle: TextStyle(color: colorWhite),
              controller: lengthController,
              keyboardType: TextInputType.number,
              fillColor: inputFillColor,
              filled: true,
              enabledBorderColor: enabledBorderColor,
              focusedBorderColor: focusedBorderColor,
              borderRadius: 13,
              onChanged: (value) {
                double length = double.tryParse(value) ?? 0;
                rectangleCalculator.setLength(length);
              },
            ),
            const SizedBox(height: 15),
            BDCalTextField(
              labelText: 'Width',
              isObsecure: false,
              textStyle: TextStyle(color: colorWhite),
              controller: widthController,
              keyboardType: TextInputType.number,
              fillColor: inputFillColor,
              filled: true,
              enabledBorderColor: enabledBorderColor,
              focusedBorderColor: focusedBorderColor,
              borderRadius: 13,
              onChanged: (value) {
                double width = double.tryParse(value) ?? 0;
                rectangleCalculator.setWidth(width);
              },
            ),
            const SizedBox(height: 20),
            BDCalValueText(
                text: 'Area: ${rectangleCalculator.area}',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textColor: colorWhite,
                backgroundColor: colorList,
                borderRadius: 10),
          ],
        ),
      ),
    );
  }
}