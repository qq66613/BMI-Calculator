import 'package:bmi/constant/constant.dart';
import 'package:bmi/view/bmi_result.dart';
import 'package:flutter/material.dart';

class bmi extends StatefulWidget {
  const bmi({Key? key}) : super(key: key);

  @override
  State<bmi> createState() => _bmi();
}

class _bmi extends State<bmi> {
  int height = 100;
  int weight = 60;
  int age = 23;
  String? gender;

  double calculateBmi() {
    double heightInMeter = height / 100;

    final h = (heightInMeter * heightInMeter);
    final bmi = weight / h;

    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.black54,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: Colors.amberAccent,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      fillColor: (gender == "male")
                          ? Colors.greenAccent
                          : primaryColor,
                      child: const IconGenderText(
                        icon: Icons.male_rounded,
                        title: "Male",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      fillColor: (gender == "female")
                          ? Colors.greenAccent
                          : primaryColor,
                      child: const IconGenderText(
                        icon: Icons.female_rounded,
                        title: "Female",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelStyle.copyWith(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "$height",
                        style: numberStyle,
                      ),
                      Text(
                        "Cm",
                        style: labelStyle.copyWith(
                          wordSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    min: 80,
                    max: 210,
                    thumbColor: const Color(0xffd4b627),
                    activeColor: Colors.greenAccent,
                    value: height.toDouble(),
                    onChanged: (value) {
                      height = value.toInt();
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$weight",
                          style: numberStyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                weight++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.greenAccent,
                              // ignore: prefer_const_constructors
                              constraints: BoxConstraints.tightFor(
                                width: 36,
                                height: 46,
                              ),
                              child: const Icon(Icons.add),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                weight--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.greenAccent,
                              // ignore: prefer_const_constructors
                              constraints: BoxConstraints.tightFor(
                                width: 36,
                                height: 46,
                              ),
                              child: const Icon(Icons.remove),
                            ), // //)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelStyle,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "$age",
                          style: numberStyle,
                        ),
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RawMaterialButton(
                              onPressed: () {
                                age++;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.greenAccent,
                              // ignore: prefer_const_constructors
                              constraints: BoxConstraints.tightFor(
                                width: 36,
                                height: 46,
                              ),
                              child: const Icon(Icons.add),
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                age--;
                                setState(() {});
                              },
                              elevation: 0,
                              shape: const CircleBorder(),
                              fillColor: Colors.greenAccent,
                              // ignore: prefer_const_constructors
                              constraints: BoxConstraints.tightFor(
                                width: 36,
                                height: 46,
                              ),
                              child: const Icon(Icons.remove),
                            ), // //)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              //print(calculateBmi());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) {
                    return Results(
                      bmi: calculateBmi(),
                    );
                  }),
                ),
              );
            },
            child: Container(
              height: 75,
              color: Colors.greenAccent,
              child: const Center(
                child: Text(
                  "Calculate Your BMI",
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

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.fillColor = primaryColor,
  }) : super(key: key);
  final Widget? child;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        decoration: BoxDecoration(
          border: Border.all(color: fillColor!),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.grey, Colors.black45],
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.greenAccent.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(5, 2)),
          ],
        ),
        child: child);
  }
}

class IconGenderText extends StatelessWidget {
  const IconGenderText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: genderStyle,
        ),
      ],
    );
  }
}
