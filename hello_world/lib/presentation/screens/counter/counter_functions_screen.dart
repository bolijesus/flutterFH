import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {

  int clickCounter = 0;
  String message = 'Clicks';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Counter FUnctions')),
          actions: [
            IconButton(icon: const Icon(Icons.refresh_rounded), onPressed: () { 
              setState(() {
                clickCounter = 0;
              });
             },)
          ],
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)), 
                Text(message = clickCounter == 1 ? 'Click' : 'Clicks', style:  const TextStyle(fontSize: 25))
              ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButtom(Icons.refresh_rounded, () {
                clickCounter = 0;              
                setState(() {});
              }
            ),

            const SizedBox(height: 10,),

            CustomButtom(Icons.plus_one, () {
              clickCounter++;
              setState(() {});
            }),

            const SizedBox(height: 10,),

            CustomButtom(Icons.exposure_minus_1_outlined, () {
              if(clickCounter == 0) return;
              clickCounter--;
              setState(() {});
            }),

            
          ],
        )
      );
  }
}

class CustomButtom extends StatelessWidget{

  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButtom(  this.icon, this.onPressed,{super.key});

  @override
  Widget build(BuildContext context) {
   return FloatingActionButton(
              onPressed: onPressed,
              child:  Icon(icon),
            );
  }
  
}