
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'registrar_producto_screen.dart';
import 'listar_productos_screen.dart';
import 'perfil_screen.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void abrirPantalla(
    BuildContext context,
    Widget pantalla,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => pantalla,
      ),
    );
  }

  void cerrarSesion(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú'),
        backgroundColor: const Color(0xFF1673F9),
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.menu),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          opcionMenu(
            icono: Icons.shopping_cart,
            titulo: 'Registrar Productos',
            onTap: () {
              abrirPantalla(
                context,
                const RegistrarProductoScreen(),
              );
            },
          ),

          opcionMenu(
            icono: Icons.list_alt,
            titulo: 'Listar Productos',
            onTap: () {
              abrirPantalla(
                context,
                const ListarProductosScreen(),
              );
            },
          ),

          opcionMenu(
            icono: Icons.person,
            titulo: 'Perfil',
            onTap: () {
              abrirPantalla(
                context,
                const PerfilScreen(),
              );
            },
          ),

          opcionMenu(
            icono: Icons.logout,
            titulo: 'Logout',
            color: Colors.red,
            onTap: () {
              cerrarSesion(context);
            },
          ),
        ],
      ),
    );
  }

  Widget opcionMenu({
    required IconData icono,
    required String titulo,
    required VoidCallback onTap,
    Color color = const Color(0xFF1673F9),
  }) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      child: ListTile(
        leading: Icon(icono, color: color),
        title: Text(
          titulo,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
