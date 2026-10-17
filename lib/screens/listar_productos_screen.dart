
import 'package:flutter/material.dart';
import '../models/producto.dart';
import 'registrar_producto_screen.dart';

class ListarProductosScreen extends StatefulWidget {
  const ListarProductosScreen({super.key});

  @override
  State<ListarProductosScreen> createState() =>
      _ListarProductosScreenState();
}

class _ListarProductosScreenState
    extends State<ListarProductosScreen> {

  String busqueda = '';

  Future<void> abrirRegistro() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const RegistrarProductoScreen(),
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final productosFiltrados = ProductosData.productos.where(
      (producto) => producto.nombre.toLowerCase().contains(
        busqueda.toLowerCase(),
      ),
    ).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),

      appBar: AppBar(
        title: const Text('Productos'),
        backgroundColor: const Color(0xFF1673F9),
        foregroundColor: Colors.white,

        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: abrirRegistro,
          ),
        ],
      ),

      body: Column(
        children: [

          // BUSCADOR
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (valor) {
                setState(() {
                  busqueda = valor;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar producto...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // LISTA DE PRODUCTOS
          Expanded(
            child: productosFiltrados.isEmpty
                ? const Center(
                    child: Text('No se encontraron productos'),
                  )
                : ListView.builder(
                    itemCount: productosFiltrados.length,

                    itemBuilder: (context, index) {
                      final producto = productosFiltrados[index];

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),

                        child: ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Color(0xFFEAF2FF),
                            child: Icon(
                              Icons.inventory_2,
                              color: Color(0xFF1673F9),
                            ),
                          ),

                          title: Text(
                            producto.nombre,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            'Precio: S/ ${producto.precio.toStringAsFixed(2)}\n'
                            'Stock: ${producto.stock}',
                          ),

                          isThreeLine: true,

                          trailing: PopupMenuButton<String>(
                            onSelected: (opcion) {
                              if (opcion == 'eliminar') {
                                setState(() {
                                  ProductosData.productos.remove(
                                    producto,
                                  );
                                });
                              }
                            },

                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'eliminar',
                                child: Text('Eliminar'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
