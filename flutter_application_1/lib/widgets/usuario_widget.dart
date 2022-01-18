import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/services/userimg_service.dart';
import 'package:image_picker/image_picker.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({Key? key}) : super(key: key);

  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  File? _imagen;
  String? _urlimagen;

  final email = TextEditingController();
  final psswrd = TextEditingController();
  final nombre = TextEditingController();
  final FotosService _fotosService = FotosService();

  Future _selectImage(ImageSource source) async {
    final imageCamera = await ImagePicker().pickImage(source: source);
    if (imageCamera == null) return;
    final imageTemporary = File(imageCamera.path);
    _imagen = imageTemporary;
    if (_imagen != null) {
      _urlimagen = await _fotosService.uploadImage(_imagen!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
              labelText: "Email", prefixIcon: Icon(Icons.person_add)),
        ),
        TextFormField(
          controller: nombre,
          decoration: const InputDecoration(
              labelText: "Usuario",
              prefixIcon: Icon(Icons.person_add)),
        ),
        TextFormField(
          controller: psswrd,
          decoration: const InputDecoration(
              labelText: "Contraseña", prefixIcon: Icon(Icons.person_add)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.black,
                    child: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    onPressed: () => _selectImage(ImageSource.camera)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                    color: Colors.black,
                    child: const Icon(
                      Icons.image,
                      color: Colors.white,
                    ),
                    onPressed: () => _selectImage(ImageSource.gallery)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                child: const Text("Aceptar"),
                onPressed: () async {
                  await _server();
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Usuario Ingresado",
                            textAlign: TextAlign.center,
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const [
                                Text(
                                  "Muchas Gracias",
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                                child: const Text(
                                  "Aceptar",
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const HomePage()),
                                  );
                                }),
                          ],
                        );
                      });
                }),
            MaterialButton(
                child: const Text("Cancelar"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }),
          ],
        )
      ])),
    );
  }

  Future<void> _server() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('registro');
      await reference.add({
        "correo": email.text,
        "nombre": nombre.text,
        "password": psswrd.text,
        "URLimg_usr": _urlimagen,
      });
    });
  }
}
