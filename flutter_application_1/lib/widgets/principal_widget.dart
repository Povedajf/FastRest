import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/comida_widget.dart';

class PrincipalWidget extends StatefulWidget {
  const PrincipalWidget({Key? key}) : super(key: key);

  @override
  _PrincipalWidgetState createState() => _PrincipalWidgetState();
}

class _PrincipalWidgetState extends State<PrincipalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/06/27/6e/06276eb0ca585a8aa76e532aafce0950.jpg"),
              fit: BoxFit.cover),
        ),
        child: ComidaWidget());
  }
}



/*Widget inicio(){
  return const Text("Bienvenido", style: TextStyle(color: Colors.white, fontSize: 35.0),);
}*/


 

