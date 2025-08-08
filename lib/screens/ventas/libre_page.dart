import 'package:flutter/material.dart';
import 'package:miki/models/venta.dart';
import 'package:miki/service/super_service.dart';

class VentaLibrePage extends StatefulWidget {
  const VentaLibrePage({super.key});

  @override
  State<VentaLibrePage> createState() => _VentaLibrePageState();
}

class _VentaLibrePageState extends State<VentaLibrePage> {
  final _formKey = GlobalKey<FormState>();
  String? _concepto;
  String? _metodoPago;
  bool _guardando = false;

  final List<String> _metodosPago = ['Efectivo', 'Tarjeta', 'Transferencia'];

  Future<void> _guardarVentaLibre() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    setState(() {
      _guardando = true;
    });

    final venta = Venta(
      tipoVenta: 'libre',
      fecha: DateTime.now().toIso8601String(),
      concepto: _concepto,
      metodoPago: _metodoPago,
    );

    try {
      // Para venta libre no hay detalles
      await AppService().registrarVentaCompleta(venta, []);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Venta libre registrada')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar venta: $e')),
      );
    } finally {
      setState(() {
        _guardando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Venta Libre'),
        backgroundColor: const Color(0xFF1B4CE0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _guardando
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Concepto',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingresa un concepto';
                        }
                        return null;
                      },
                      onSaved: (value) => _concepto = value,
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Método de Pago',
                        border: OutlineInputBorder(),
                      ),
                      items: _metodosPago
                          .map((m) => DropdownMenuItem(
                                value: m,
                                child: Text(m),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Selecciona un método de pago';
                        }
                        return null;
                      },
                      onChanged: (value) => _metodoPago = value,
                      onSaved: (value) => _metodoPago = value,
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: _guardarVentaLibre,
                      child: const Text('Guardar Venta Libre'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B4CE0),
                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
