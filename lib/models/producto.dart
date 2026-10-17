
class Producto {
  final String nombre;
  final String descripcion;
  final double precio;
  final int stock;

  Producto({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.stock,
  });
}

class ProductosData {
  static final List<Producto> productos = [
    Producto(
      nombre: 'Laptop',
      descripcion: 'Laptop portátil',
      precio: 3500,
      stock: 10,
    ),
    Producto(
      nombre: 'Mouse',
      descripcion: 'Mouse inalámbrico',
      precio: 50,
      stock: 25,
    ),
    Producto(
      nombre: 'Teclado',
      descripcion: 'Teclado mecánico',
      precio: 120,
      stock: 15,
    ),
    Producto(
      nombre: 'Monitor',
      descripcion: 'Monitor LED',
      precio: 800,
      stock: 8,
    ),
  ];
}
