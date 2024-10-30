import 'package:bmi_cal/result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  

  void calculateBMI() {
    String weightText = weightController.text;
    String heightText = heightController.text;
    
    // Input validation
    if (weightText.isEmpty || heightText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both weight and height.',
          style: GoogleFonts.lato()
          ,)),
      );
      return;
    }
    // Navigate to the Result page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(
          weight: weightText,
          height: heightText,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Calculate Your BMI",
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          SizedBox(height: 10),

          // For Picture
          Container(
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ClipOval(
              child: Image.asset("assets/images/2.png", scale: 3.5),
            ),
          ),

          // For Weight
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Weight (Kg):",
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: weightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.7),width: 2,),
                    ),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    labelText: "Enter Your weight",
                    labelStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(1),
                    fontSize: 20.0,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // For Height
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Height (Cm):",
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: heightController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black.withOpacity(0.7),width: 2,),
                    ),
                    fillColor: Colors.white.withOpacity(0.1),
                    filled: true,
                    labelText: "Enter Your height",
                    labelStyle: GoogleFonts.lato(
                      color: Colors.black.withOpacity(1),
                      fontSize: 20.0,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Button
          Container(
            height: 40,
            width: 200,
            child: ElevatedButton(
              onPressed: calculateBMI,
              child: Text(
                "Calculate",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
