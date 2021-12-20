import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/platos_model.dart';

class CardPlatos extends StatelessWidget {
  const CardPlatos({Key? key, required this.model}) : super(key: key);
  final Plato model;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9.0,
      child: ListTile(
        title: Text(model.fieldsProto!.nombrePlato!.stringValue.toString(),
            style: Theme.of(context).textTheme.headline6),
        subtitle: Text(
            model.fieldsProto!.descripcionPlato!.stringValue!.toString(),
            style: Theme.of(context).textTheme.subtitle2),
        trailing: Text(
            "Valor Plato: " +
                model.fieldsProto!.valorPlato!.doubleValue.toString() +
                " \$",
            style: Theme.of(context).textTheme.headline6),
      ),
    );
  }
}