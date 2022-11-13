import 'package:flutter/material.dart';
import 'package:bmi/view/bmi_screen.dart';
import 'package:bmi/constant/constant.dart';

class Results extends StatelessWidget {
  const Results({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  String determineBmiCategory(double bmiValue) {
    String category = "";

    if (bmiValue < 16.0) {
      category = "Under Weight Severe";
    } else if (bmiValue >= 16.0 && bmiValue < 17.0) {
      category = "Under Weight Moderate";
    } else if (bmiValue >= 17.0 && bmiValue < 18.5) {
      category = "Under Weight Mild";
    } else if (bmiValue >= 18.5 && bmiValue < 25) {
      category = "Normal";
    } else if (bmiValue >= 25 && bmiValue < 30) {
      category = "Over Weight";
    } else if (bmiValue >= 30 && bmiValue < 35) {
      category = "Obese I";
    } else if (bmiValue >= 35 && bmiValue < 40) {
      category = "Obese II";
    } else if (bmiValue > 40) {
      category = "Obese III";
    }
    return category;
  }

  String getHelpDescription(String categoryName) {
    String desc = "";
    switch (categoryName) {
      case "Under Weight Severe":
      case "Under Weight Moderate":
      case "Under Weight Mild":
        desc = "Posibble Nutrional Defeciency and Ostheoporosis.";
        break;
      case "Normal":
        desc = "Low Risk Weight Disease";
        break;
      case "Over Weight":
        desc =
            "Moderate Risk of Developing Heart Disease,High Blood Pressure,stroke and diabetes";
        break;
      case "Obese I":
      case "Obese II":
      case "Obese III":
        desc =
            "High Risk of Developing Heart Disease,High Blood Pressure,stroke and diabetes with metabolic syndrome";
        break;
      default:
    }
    return desc;
  }

  @override
  Widget build(BuildContext context) {
    final bmiCategory = determineBmiCategory(bmi);
    final bmiDesc = getHelpDescription(bmiCategory);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.black54,
        title: const Text(
          "BMI Calculator Results",
          style: TextStyle(color: Colors.amberAccent),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
              child: Center(
            child: Text("Results Calculate",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent)),
          )),
          Expanded(
              flex: 5,
              child: BmiCard(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        bmiCategory,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                      Text(
                        bmiDesc,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              //   MaterialPageRoute(
              //     builder: ((context) {
              //       return bmi();
              //     }),
              //   ),
              // );
            },
            child: Container(
              height: 75,
              color: Colors.greenAccent,
              child: const Center(
                child: Text(
                  "Recalculate BMI",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
