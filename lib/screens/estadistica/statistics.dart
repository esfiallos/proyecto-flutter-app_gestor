import 'package:flutter/material.dart';
import 'package:miki/models/views/producto_mas_vendido.dart';
import 'package:miki/models/views/metodo_pago_mayor.dart';
import 'package:miki/models/views/producto_masvendido_mes.dart';
import 'package:miki/models/views/producto_menovendido_mes.dart';
import 'package:fl_chart/fl_chart.dart'
    show
        BarChart,
        BarChartData,
        BarChartGroupData,
        BarChartRodData,
        FlTitlesData,
        AxisTitles,
        SideTitles,
        FlBorderData,
        FlGridData,
        BarChartAlignment;
import 'package:miki/service/super_service.dart';
import 'package:miki/widgets/MenuBar.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  ProductoMasVendido? _productoMasVendido;
  MetodoPagoMasUsado? _metodoPagoMasUsado;
  List<ProductoMasVendidoPorMes> _masVendidosPorMes = [];
  List<ProductoMenosVendidoPorMes> _menosVendidosPorMes = [];

  final AppService _service = AppService();

  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    try {
      final producto = await _service.obtenerProductoMasVendido();
      debugPrint('Producto más vendido cargado correctamente');

      final metodo = await _service.obtenerMetodoPagoMasUsado();
      debugPrint('Método de pago cargado correctamente');

      final vendidos = await _service.obtenerProductosMasVendidosPorMes();
      debugPrint('Productos más vendidos cargados correctamente');

      final noVendidos = await _service.obtenerProductosMenosVendidosPorMes();
      debugPrint('Productos menos vendidos cargados correctamente');

      setState(() {
        _productoMasVendido = producto;
        _metodoPagoMasUsado = metodo;
        _masVendidosPorMes = vendidos;
        _menosVendidosPorMes = noVendidos;
        _isLoading = false;
      });
    } catch (e, stackTrace) {
      debugPrint('Error cargando estadísticas: $e');
      debugPrint('$stackTrace');
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  Map<String, double> _filtrarVentasSinFiltro(List<dynamic> datos) {
    return datos.take(5).fold<Map<String, double>>({}, (map, e) {
      double cantidad;
      if (e.cantidadTotal is int) {
        cantidad = (e.cantidadTotal as int).toDouble();
      } else if (e.cantidadTotal is double) {
        cantidad = e.cantidadTotal;
      } else {
        cantidad = 0;
      }
      map[e.nombre] = cantidad;
      return map;
    });
  }

  Widget _buildInfoCard({
    required String label,
    String? value,
    String? subValue,
  }) {
    final bool noData = value == null || value.isEmpty || value == '0';

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(noData ? 'No hay datos' : subValue ?? ''),
        trailing: Text(
          noData ? '-' : value!,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildChartSection({
  required String title,
  required Map<String, double> dataPoints,
  Color? chartColor,
}) {
  if (dataPoints.isEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),  // más espacio antes del título
        Text(title,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        const Text('No hay datos para mostrar',
            style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  final entries = dataPoints.entries.toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 24),  // más espacio antes del título
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      const SizedBox(height: 20),  // más separación entre título y gráfico
      SizedBox(
        height: 200,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            barGroups: entries.asMap().entries.map((entry) {
              final index = entry.key;
              final data = entry.value;
              return BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: data.value,
                    width: 20,
                    color: chartColor ?? Colors.deepPurple,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ],
                showingTooltipIndicators: [0],
              );
            }).toList(),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    final index = value.toInt();
                    if (index < 0 || index >= entries.length) return const SizedBox.shrink();
                    final entry = entries[index];
                    return Text(entry.key,
                        style: const TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis);
                  },
                ),
              ),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: false),
          ),
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_hasError) {
      return Scaffold(
        appBar: AppBar(title: const Text('Estadísticas')),
        body: const Center(child: Text('Error al cargar las estadísticas')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInfoCard(
                label: 'El producto más vendido',
                value: _productoMasVendido?.nombre,
                subValue:
                    'Vendidas: ${_productoMasVendido?.totalVendido ?? 0}',
              ),
              _buildInfoCard(
                label: 'Método de pago más usado',
                value: _metodoPagoMasUsado?.metodoPago?.toString() ?? 'Desconocido',
                subValue:
                    '${_metodoPagoMasUsado?.totalUsos ?? 0}',
              ),
              const SizedBox(height: 16),
              _buildChartSection(
                title: 'Top 5 De Ventas',
                dataPoints: _filtrarVentasSinFiltro(_masVendidosPorMes),
              ),
              _buildChartSection(
                title: 'Productos Menos Vendidos',
                dataPoints: _filtrarVentasSinFiltro(_menosVendidosPorMes),
                chartColor: Colors.lightBlue,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MenuBarraAbajo(currentIndex: 1),
    );
  }
}
