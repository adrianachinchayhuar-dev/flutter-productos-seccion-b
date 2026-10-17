
import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final nombreController =
      TextEditingController(text: 'Juan Pérez');

  final correoController =
      TextEditingController(text: 'juan.perez@correo.com');

  final telefonoController =
      TextEditingController(text: '987654321');

  bool editando = false;

  @override
  void dispose() {
    nombreController.dispose();
    correoController.dispose();
    telefonoController.dispose();
    super.dispose();
  }

  void editarPerfil() {
    if (editando) {
      if (nombreController.text.trim().isEmpty ||
          correoController.text.trim().isEmpty ||
          telefonoController.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Complete todos los campos'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Perfil actualizado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }

    setState(() {
      editando = !editando;
    });
  }

  Widget campoPerfil({
    required TextEditingController controller,
    required String titulo,
    required IconData icono,
    TextInputType tipo = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        readOnly: !editando,
        keyboardType: tipo,
        onChanged: (_) {
          if (editando) setState(() {});
        },
        decoration: InputDecoration(
          labelText: titulo,
          prefixIcon: Icon(
            icono,
            color: const Color(0xFF1673F9),
          ),
          filled: true,
          fillColor: editando
              ? Colors.white
              : const Color(0xFFF7F9FC),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF1673F9),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Card(
              color: Colors.white,
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 48,
                      backgroundColor: Color(0xFFEAF2FF),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF1673F9),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      nombreController.text,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      correoController.text,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),

                    campoPerfil(
                      controller: nombreController,
                      titulo: 'Nombre',
                      icono: Icons.person_outline,
                    ),

                    campoPerfil(
                      controller: correoController,
                      titulo: 'Email',
                      icono: Icons.email_outlined,
                      tipo: TextInputType.emailAddress,
                    ),

                    campoPerfil(
                      controller: telefonoController,
                      titulo: 'Teléfono',
                      icono: Icons.phone_outlined,
                      tipo: TextInputType.phone,
                    ),

                    const ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: Color(0xFF1673F9),
                      ),
                      title: Text('Rol'),
                      trailing: Text('Administrador'),
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton(
                        onPressed: editarPerfil,
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              const Color(0xFF1673F9),
                          side: const BorderSide(
                            color: Color(0xFF1673F9),
                          ),
                        ),
                        child: Text(
                          editando
                              ? 'GUARDAR CAMBIOS'
                              : 'EDITAR PERFIL',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
