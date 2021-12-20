import 'package:flutter/material.dart';


class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({Key? key}) : super(key: key);

  @override
  _PrincipalWidgetState createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
  }
}

Widget cuerpo(){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://i.pinimg.com/564x/06/27/6e/06276eb0ca585a8aa76e532aafce0950.jpg"),
      fit: BoxFit.cover
      ),
    ),
    child: Center(
      child: Column(
        /*mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          inicio(),
          const SizedBox(height: 25,),
          botonInicio()
        ],*/
      ),
    ),    
  );
}

/*Widget inicio(){
  return const Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 35.0),);
}*/


 

