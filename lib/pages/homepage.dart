import 'package:bmi_calculator/pages/result.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var wtController = TextEditingController();
  double ftvalue=0;
  double inchvalue=0;
  var result = "";
  var bmi=0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
        elevation: 2,
        title: Center(child: 
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 55,
                height: 55,
              child:Image.asset("assets/images/bmi.png"),),
              const SizedBox(width: 10,),
               const Text('BMI Calculator',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ))),
           body:  
                   
                      Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                      const SizedBox(height: 10,),
                                    const Text("Enter your weight (in kg)",
                                      style:TextStyle(
                                          fontSize: 20,
                             )
                           ),
                        const SizedBox(height: 7,),
                        Container(
                          width:350,
                          height: 50,
                          child: TextField(
                          controller: wtController,
                          
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.monitor_weight_outlined),
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          ),
                          keyboardType: TextInputType.number,
                           ),
                        ) ,
                        const SizedBox(height: 7,),
                        const Text("Enter your height ",
                                      style:TextStyle(
                                          fontSize: 20,
                             )
                           ),
                           const SizedBox(height: 7,),
                           
                          const Text('Feet',style:TextStyle(
                            fontSize:15,
                           )),
                            const SizedBox(height: 7,),
                            Slider(
                              value: ftvalue, 
                              min:0,
                              max:10,
                              divisions: 10,
                              label: ftvalue.round().toString(),
                              onChanged:(double value)=>setState(()=> ftvalue = value)),
                            const Text('Inches',style:TextStyle(
                            fontSize:15,
                           )),
                            const SizedBox(height: 7,),
                            Slider(
                              value: inchvalue, 
                              min:0,
                              max:12,
                              divisions: 12,
                               label: inchvalue.round().toString(),
                              onChanged:(double  value)=>setState(()=> inchvalue = value)),
                              const SizedBox(height: 7,),
                              ElevatedButton(
                                onPressed: ()
                                {
                                  var wt=wtController.text.toString();
                                  var ft=ftvalue.toString();
                                  var inch =inchvalue.toString();
                                  if(wt !="" && ft !="" && inch!=""){
                                     
                                     var iWt= int.parse(wt);
                                     var iFt=double.parse(ft);
                                     var iInch=double.parse(inch);


                                     var tInch= (iFt*12)+iInch;

                                     var tCm= tInch*2.54;

                                     var tM = tCm/100;

                                      bmi = iWt/(tM*tM);

                                      var msg ="";
                                      var bgcolor;
                                      if(bmi<18){
                                        msg="You are UNDERWEIGHT";
                                        bgcolor=Colors.yellow.shade300;
                                      }
                                      else if(bmi>=18 && bmi<25){
                                        msg="You are HEALTHY";
                                        bgcolor=Colors.green;
                                      }
                                      else if(bmi>=25 && bmi<30){
                                        msg="You are OVERWEIGHT";
                                        bgcolor=Colors.orange.shade400;
                                      }
                                      else{
                                        msg="You are OBESE";
                                        bgcolor=Colors.red.shade400;
                                      }

                                     setState(() {
                                       result="Your BMI is $bmi";
                                     });
                                      Navigator.push(
                                       context, 
                                      MaterialPageRoute(builder: (context)=>ResultPage(bmi.toDouble(),msg.toString(),bgcolor)));

                                  }
                                  else{
                                     setState(() {
                                       result="Please! fill all required details";
                                     });
                                  }
                                 
                                },
                                 child: Text("Calculate",style:TextStyle(fontSize:20)),
                                  style: ElevatedButton.styleFrom(
                                   backgroundColor: Colors.green.shade400,
                                   foregroundColor: Colors.black,
                                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                    textStyle: TextStyle(
                                    fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                                 
                                 ),

                                 const SizedBox(height: 7,),

                                //   Text(result, 
                                //  style:TextStyle(
                                //   fontSize: 20,
                                //   color: Colors.red,
                                //  )
                                //  )

                                 ],),
                   );
           
    
  }
}