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
           body:  Expanded(
                   child: Center(
                     child: Column(
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
                              onChanged:(value)=>setState(()=> this.ftvalue = value)),
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
                              onChanged:(value)=>setState(()=> this.inchvalue = value)),
                              const SizedBox(height: 7,),
                              ElevatedButton(
                                onPressed: ()
                                {
                                  Navigator.push(
                                       context, 
                                      MaterialPageRoute(builder: (context)=>ResultPage()));
                                },
                                 child: Text("Calculate",style:TextStyle(fontSize:20)))
                                 ],),
                   )
           ),
      );
    
  }
}