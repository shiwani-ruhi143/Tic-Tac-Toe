import 'dart:html';

import 'package:flutter/material.dart';

class Gamepage extends StatefulWidget {
  @override
  _GamepageState createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  int ohscore = 0;
  int exscore = 0;
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
  int filledBoxes = 0;
  bool ohTurn = true;

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
                    padding:
                        const EdgeInsets.only(left: 40, top: 100, bottom: 20),
                    child: Container(
                      width: 150,
                      child: const Text('Player O',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontFamily: 'Oswald',
                          )),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Text(
                      ohscore.toString(),
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
                    padding:
                        const EdgeInsets.only(top: 100, right: 25, bottom: 20),
                    child: Container(
                      width: 150,
                      child: const Text(
                        'Player X',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.pink,
                            fontSize: 30,
                            fontFamily: 'Oswald'),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Text(
                      exscore.toString(),
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
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[600]!)),
                      child: Center(
                        child: Text(
                          displayExOh[index],
                          style: TextStyle(
                            color: Colors.amber[50],
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkwinner();
    });
  }

  void _checkwinner() {
    //for ist row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[1] == displayExOh[2] &&
        displayExOh[0] != '') {
        _showWinDialog(displayExOh[0]);
        }
    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }
    else if(filledBoxes==9){
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
      showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context){
        return  AlertDialog(
          title: Text('Winner is' + winner),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again !'),
              onPressed:(){
                _clearBoard();
                Navigator.of(context).pop;
              }
            )
          ],
        );
      }
    
    );
    if(winner=='O')
    {
      ohscore+=1;
    }
    else if(winner=='X')
    {
      exscore+=1;
    }
  }
  void _showDrawDialog(){
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (BuildContext context){
        return  AlertDialog(
          title: const Text('DRAW'),
          actions: <Widget>[
            TextButton(
              child: const Text('Play Again !'),
              onPressed:(){
                _clearBoard();
                Navigator.of(context).pop;
              }
            )
          ],
        );
      }
    
    );
    
  }
  void _clearBoard(){
   setState(() {
     for(int i=0;i<9;i++)
     {
       displayExOh[i]='';
     }
   }); 
   filledBoxes=0;
  }
}

