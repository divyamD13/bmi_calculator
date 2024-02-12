import 'package:bmi_calculator/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:kdgaugeview/kdgaugeview.dart';

class ResultPage extends StatelessWidget {
  var bmiFromHome;
  var bmicolor;
  var msg;
   ResultPage(this.bmiFromHome,this.msg,this.bmicolor);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI Score",
      style:TextStyle(
         fontSize: 25,
         fontWeight: FontWeight.bold,
      ),),
      backgroundColor:Colors.green.shade400,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
                Container(
                  height: 400,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  child: KdGaugeView(
                    minSpeed: 0,
                     maxSpeed:50,
                     speed: bmiFromHome,
                     animate:true,
                     duration: Duration(seconds: 4),
                     alertSpeedArray: [0,18,25,30],
                     alertColorArray: [Colors.yellow.shade300,Colors.green,Colors.orange.shade400,Colors.red.shade400],
                     unitOfMeasurement: "kg/m2",
                     gaugeWidth: 15,
                     fractionDigits: 2,
                     ),
                ),
                const SizedBox(height: 8,
                ),
                Container(
                  width: 300,
                  height:150,
                  decoration:BoxDecoration(
                         color:bmicolor,
                         borderRadius: BorderRadius.circular(8),
                       ) ,
                  child: Center(
                    child: Text(" $msg \n Your BMI Score is ${bmiFromHome.toStringAsFixed(2)}",
                    style:TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
               const SizedBox(height: 13,
                ),
             ElevatedButton(onPressed: (){
              Navigator.pop(
             context, 
              MaterialPageRoute(builder: (context)=>HomePage()));
             }, child: Text("Check Again"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade400,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold)),
             ),
             
                    
        ],
      )
      );
  }
}