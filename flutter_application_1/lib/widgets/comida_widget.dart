
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/platos_model.dart';
import 'package:flutter_application_1/services/platos_services.dart';
import 'package:flutter_application_1/widgets/card_comida.dart';

class ComidaWidget extends StatefulWidget {
  const ComidaWidget({Key? key}) : super(key: key);

  @override
  _ComidaWidgetState createState() => _ComidaWidgetState();
}

class _ComidaWidgetState extends State<ComidaWidget> {


  final  PlatosService _platosserviceapp =  PlatosService();
  List<Plato>? _listaplatos;


  @override
      void initState() {
    super.initState();
    _downloadplatos();
  }


  @override
  Widget build(BuildContext context) {
    return _listaplatos == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()))
        : _listaplatos!.isEmpty
            ? const Center(
                child: SizedBox(
                    child: Text("No existen Platos")))
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 14.0),
                
                    child: ListView(
                  children:  _listaplatos!.map((e) => CardPlatos(model: e)).toList()));
  }

  _downloadplatos() async {
    _listaplatos = await  _platosserviceapp.getResponse();
    setState(() {});
  }
}