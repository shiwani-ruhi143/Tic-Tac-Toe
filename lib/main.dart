import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'gamepage.dart';
void main() {
  runApp(Homepage());
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                child: Expanded(
                  flex: 2,
                
                  child: AvatarGlow (
                    endRadius: 140,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.yellow,
                    repeat:true,
                    shape: BoxShape.circle,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
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
              )
            ],
          ),
          
          ),
    );
  }
}
