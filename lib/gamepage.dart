import 'package:flutter/material.dart';
class Gamepage extends StatefulWidget {
  

  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
int ohscore=0;
int exscore=0;
List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int filledBoxes=0;
bool ohTurn=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:40 ,top:100,bottom: 20 ),
                    child: Container(
                      width: 150,
                      
                      
                      child:const Text('Player O',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                        fontFamily: 'Oswald',
                        
                      )
                      ) ,
                      decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            
                      ),
                    ),
                  
                  ),
                  Container(
                     width: 50,
                    child: Text(ohscore.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.lightBlueAccent,
                    ),
                    ),
                    
                  )
                ],
                
              ),
              
              Column(
                children: [
                  Padding(
                    
                    padding: const EdgeInsets.only(top: 100,right: 25,bottom: 20),
                    child: Container(
                      width: 150,
                      child: const Text('Player X',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 30,
                        fontFamily: 'Oswald'
                      ),
                      ),
                      decoration:  BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(25) ,
                      ),
                    ),
                    
                  ),
                  Container(
                    width: 50,
                    child: Text(exscore.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.lightBlueAccent,
                    ),
                    ),
                  )
                ],
              )
              
            ],
          ),
          Container(
            height: 500,
            
            
            child: GridView.builder(
              itemCount: 9 , 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                    _tapped(index);
                  },
                  child: Container(
                    
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[600]!)
                    ),
                    child: Center(
                      child: Text(displayExOh[index],
                      style: TextStyle(
                        color: Colors.amber[50],
                        fontSize: 40,
                      ),
                      ),
                    ),
                  ),
                );
                
              }
            ),
          )
        ],
      
      ),
      
      
    );
   
    }
    void _tapped(int index){
      setState(() {
        if(ohTurn && displayExOh[index]==''){
          displayExOh [index] ='O';
          filledBoxes+=1;
        }
        else if(!ohTurn && displayExOh[index]==''){
          displayExOh[index]='X';
          filledBoxes+=1;
        }
        ohTurn=!ohTurn;
      });
    }
}