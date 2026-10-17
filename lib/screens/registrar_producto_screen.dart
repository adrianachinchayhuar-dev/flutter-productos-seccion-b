
import 'package:flutter/material.dart';
import '../models/producto.dart';

class RegistrarProductoScreen extends StatefulWidget {
  const RegistrarProductoScreen({super.key});

  @override
  State<RegistrarProductoScreen> createState() =>
      _RegistrarProductoScreenState();
}

class _RegistrarProductoScreenState
    extends State<RegistrarProductoScreen> {

  final formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();
  final precioController = TextEditingController();
  final stockController = TextEditingController();

  @override
  void dispose() {
    nombreController.dispose();
    descripcionController.dispose();
    precioController.dispose();
    stockController.dispose();
    super.dispose();
  }

  // GUARDAR PRODUCTO
  void guardarProducto() {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final nuevoProducto = Producto(
      nombre: nombreController.text.trim(),
      descripcion: descripcionController.text.trim(),
      precio: double.parse(
        precioController.text.trim().replaceAll(',', '.'),
      ),
      stock: int.parse(stockController.text.trim()),
    );

    ProductosData.productos.add(nuevoProducto);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Producto registrado correctamente'),
        backgroundColor: Colors.green,
      ),
    );

    nombreController.clear();
    descripcionController.clear();
    precioController.clear();
    stockController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text('Registrar Producto'),
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

                child: Form(
                  key: formKey,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      // IMAGEN REFERENCIAL
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F3F5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Seleccionar imagen',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // NOMBRE
                      TextFormField(
                        controller: nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre del producto',
                          prefixIcon: Icon(Icons.inventory_2),
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Ingrese el nombre';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // DESCRIPCIÓN
                      TextFormField(
                        controller: descripcionController,
                        maxLines: 2,
                        decoration: const InputDecoration(
                          labelText: 'Descripción',
                          prefixIcon: Icon(Icons.description),
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          if (valor == null || valor.trim().isEmpty) {
                            return 'Ingrese la descripción';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // PRECIO
                      TextFormField(
                        controller: precioController,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Precio',
                          prefixText: 'S/ ',
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          final precio = double.tryParse(
                            (valor ?? '').trim().replaceAll(',', '.'),
                          );

                          if (precio == null ||
                              !precio.isFinite ||
                              precio <= 0) {
                            return 'Ingrese un precio válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // STOCK
                      TextFormField(
                        controller: stockController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Stock',
                          prefixIcon: Icon(Icons.numbers),
                          border: OutlineInputBorder(),
                        ),
                        validator: (valor) {
                          final stock = int.tryParse(
                            (valor ?? '').trim(),
                          );

                          if (stock == null || stock < 0) {
                            return 'Ingrese un stock válido';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      // BOTÓN GUARDAR
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: guardarProducto,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFF1673F9),
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('GUARDAR'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
