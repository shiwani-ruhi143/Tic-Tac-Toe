import 'package:flutter/material.dart';
import 'gamepage.dart';
import 'package:avatar_glow/avatar_glow.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            title: const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('TIC TAC TOE',
                  style: TextStyle(
                    fontSize: 50,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Rubik_Beastly',
                  )),
            ),
            backgroundColor: Colors.black87,
            centerTitle: true,
          ),
        ),
        backgroundColor: Colors.grey[900],
        body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Center(
              child: AvatarGlow (
                endRadius: 140,
                duration:const Duration(seconds: 2),
                glowColor: Colors.yellow,
                repeat:true,
                shape: BoxShape.circle,
                repeatPauseDuration: const Duration(seconds: 1),
                startDelay:const Duration(seconds: 1),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    height: 225,
                    width: 225,
                    child: CircleAvatar(backgroundColor: Colors.grey[900],
                     child: Image.asset('assets/images/tictactoelogo.png',fit:BoxFit.scaleDown,color: Colors.white,),
                     
                     ),
                  ),
                ),
              ),
            ),
           GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> Gamepage()));
               
              },
              child: Padding(padding:const EdgeInsets.only(left: 40,bottom: 150,right: 40),
              child: Container(
                padding: const EdgeInsets.all(30),
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.deepOrange,
                  
                ),
                child:const Center(
                  child: Text('PLAY GAME',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 40,
                  ),
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