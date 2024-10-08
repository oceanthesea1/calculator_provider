import 'package:calculator_provider/bangun_datar/bd_calculators.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_appbar.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_color.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_text_field.dart';
import 'package:calculator_provider/bangun_datar/widgets/bd_value_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TrianglePage extends StatefulWidget {
  const TrianglePage({super.key});

  @override
  State<TrianglePage> createState() => _TrianglePageState();
}

class _TrianglePageState extends State<TrianglePage> {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void dispose() {
    baseController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final triangleCalculator = Provider.of<TriangleCalculator>(context);
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
              Icons.change_history_rounded, 
              size: 200, 
            ),
            SizedBox(height: 30), 
            BDCalTextField(
              labelText: 'Base Length',
              isObsecure: false,
              textStyle: TextStyle(color: colorWhite),
              controller: baseController,
              keyboardType: TextInputType.number,
              fillColor: inputFillColor,
              filled: true,
              enabledBorderColor: enabledBorderColor,
              focusedBorderColor: focusedBorderColor,
              borderRadius: 13,
              onChanged: (value) {
                double base = double.tryParse(value) ?? 0;
                triangleCalculator.setBase(base);
              },
            ),
            const SizedBox(height: 15),
            BDCalTextField(
              labelText: 'Height Length',
              isObsecure: false,
              textStyle: TextStyle(color: colorWhite),
              controller: heightController,
              keyboardType: TextInputType.number,
              fillColor: inputFillColor,
              filled: true,
              enabledBorderColor: enabledBorderColor,
              focusedBorderColor: focusedBorderColor,
              borderRadius: 13,
              onChanged: (value) {
                double height = double.tryParse(value) ?? 0;
                triangleCalculator.setHeight(height);
              },
            ),
            const SizedBox(height: 20),
            BDCalValueText(
                text: 'Area: ${triangleCalculator.area}',
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
