import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/principal_widget.dart';
import 'package:flutter_application_1/widgets/usuario_widget.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.app_registration, "Registro de Usuario"),
  ItemMenu(Icons.restaurant_menu_rounded, "Pagina Principal"),
];

List<Widget> contentWidgets = [
  const RegistroUsuario(),
  const PrincipalWidget(),
];
