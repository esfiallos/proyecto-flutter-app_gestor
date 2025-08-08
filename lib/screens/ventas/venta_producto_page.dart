import 'package:flutter/material.dart';

class NuevaVentaModal extends StatelessWidget {
  final VoidCallback onVentaProductos;
  final VoidCallback onVentaLibre;

  const NuevaVentaModal({
    super.key,
    required this.onVentaProductos,
    required this.onVentaLibre,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Nueva Venta",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            const Text("Seleccione el tipo de venta que desee hacer"),
            const SizedBox(height: 20),
            VentaOption(
              color: const Color(0xFFE9F8AB),
              title: "Venta de Productos",
              subtitle: "Registra una venta seleccionando productos",
              icon: Icons.shopping_cart_outlined,
              onTap: onVentaProductos,
            ),
            const SizedBox(height: 10),
            VentaOption(
              color: const Color(0xFFC3E5BE),
              title: "Venta Libre",
              subtitle: "Registra un ingreso sin inventario",
              icon: Icons.attach_money_outlined,
              onTap: onVentaLibre,
            ),
          ],
        ),
      ),
    );
  }
}

class VentaOption extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const VentaOption({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
