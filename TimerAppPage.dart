import 'dart:async';

import 'package:flutter/material.dart';

class TimerApp extends StatefulWidget {
  

  @override
  _TimerAppState createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  int _Counter = 15;
  late Timer _timer;

  void startTimer(){
    
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if(_Counter > 0){
         setState(() {
           _Counter--;
         });
       }else{
         _timer.cancel();
       }
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
    body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
           Text('$_Counter',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
           ElevatedButton(onPressed: (){
             startTimer();
           }, child: Text('Start Timer')),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             
             setState(() {
               _timer.cancel();
             });
           }, child: Text('Pause')),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             setState(() {
               _timer.cancel();
               _Counter = 15;
             });
           }, child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}