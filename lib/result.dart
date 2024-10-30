import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatelessWidget {
  final String weight;
  final String height;

  Result({
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    double weightInKg = double.parse(weight);
    double heightInCm = double.parse(height);
    double heightInM = heightInCm / 100; // height to meters
    double bmi = calculateBMI(weightInKg, heightInM);
    String result = outputStatus(bmi);
    String image = showImage(result);
    Color textColor = textColoring(result);
    String description = descriptionText(result);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Result",
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body:
      SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.width * 0.1,
                horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //SizedBox(width: MediaQuery.of(context).size.width * 0.16,),
                    Text("Your BMI is: ",
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold, color: Colors.white,
                    ),),
                    Text(
                      "${bmi.toStringAsFixed(2)}",
                      style: GoogleFonts.lato(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //SizedBox(width: MediaQuery.of(context).size.width * 0.12,),
                        Text("Your are: ",
                          style: GoogleFonts.lato(
                            fontSize: 30,
                            fontWeight: FontWeight.bold, color: Colors.white,
                          ),
                        ),
                        Text(
                          "$result",
                          style: GoogleFonts.lato(
                            fontSize: 30,
                            color: textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //For displaying the image
                if (image.isNotEmpty)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
                        ),
                        padding: EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            image,
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.7,
                            fit: BoxFit.cover,

                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(height:20,),
                Center(
                  child: Text(description,
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                    textAlign: TextAlign.center,),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Let's Calculate Again",
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  String outputStatus(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal Weight";
    } else if (bmi < 40) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
  String showImage(String result) {
    switch (result) {
      case "Underweight":
        return "assets/images/under.png";
      case "Normal Weight":
        return "assets/images/normal.png";
      case "Overweight":
        return "assets/images/over.png";
      case "Obese":
        return "assets/images/obese.png";
      default:
        return "";
    }
  }
  Color textColoring(String result) {
    switch (result) {
      case "Underweight":
        return Colors.lightBlue;
      case "Normal Weight":
        return Colors.greenAccent;
      case "Overweight":
        return Colors.orange;
      case "Obese":
        return Colors.redAccent;
      default:
        return Colors.white;
    }
  }
  String descriptionText(String result) {
    switch (result) {
      case "Underweight":
        return "Fu marle to ure jaba!!.";
      case "Normal Weight":
        return "Ekdom jhakkas! Chaliyee jaw";
      case "Overweight":
        return "Somoy thakte maintain kore felo.";
      case "Obese":
        return "Nijer sorir dekhecho koto mota hoyecho?.";
      default:
        return "";
    }
  }
}
