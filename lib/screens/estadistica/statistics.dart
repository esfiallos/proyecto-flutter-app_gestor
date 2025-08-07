import 'package:flutter/material.dart';
import 'package:miki/models/views/producto_mas_vendido.dart';
import 'package:miki/models/views/metodo_pago_mayor.dart';
import 'package:miki/models/views/producto_masvendido_mes.dart';
import 'package:miki/models/views/producto_menovendido_mes.dart';
import 'package:fl_chart/fl_chart.dart' show BarChart, BarChartData, BarChartGroupData, BarChartRodData, FlTitlesData, AxisTitles, SideTitles, FlBorderData, FlGridData, BarChartAlignment;
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
  final List<String> _meses = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
  ];
  Set<String> _selectedMonth = {'Julio'};

  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    final producto = await _service.obtenerProductoMasVendido();
    final metodo = await _service.obtenerMetodoPagoMasUsado();
    final vendidos = await _service.obtenerProductosMasVendidosPorMes();
    final noVendidos = await _service.obtenerProductosMenosVendidosPorMes();

    setState(() {
      _productoMasVendido = producto;
      _metodoPagoMasUsado = metodo;
      _masVendidosPorMes = vendidos;
      _menosVendidosPorMes = noVendidos;
    });
  }

  Map<String, double> _filtrarVentasPorMes(List<dynamic> datos, String mes) {
    return datos
        .where((e) => e.mes == mes)
        .take(5)
        .fold<Map<String, double>>({}, (map, e) {
      map[e.nombre] = e.cantidad.toDouble();
      return map;
    });
  }

  Widget _buildInfoCard({required String label, required String value, required String subValue}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subValue),
        trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildChartSection({required String title, required Map<String, double> dataPoints, Color? chartColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: dataPoints.entries.map((entry) {
                return BarChartGroupData(
                  x: entry.key.hashCode,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value,
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
                      final entry = dataPoints.keys.firstWhere(
                          (key) => key.hashCode == value.toInt(),
                          orElse: () => '');
                      return Text(entry, style: const TextStyle(fontSize: 10), overflow: TextOverflow.ellipsis);
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
    final String mesActual = _selectedMonth.first;
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildInfoCard(
                label: 'El producto más vendido',
                value: _productoMasVendido?.nombre ?? 'Sin datos',
                subValue: 'Vendidas: ${_productoMasVendido?.totalVendido ?? 0}',
              ),
              _buildInfoCard(
                label: 'Método de pago más usado',
                value: _metodoPagoMasUsado?.metodoPago ?? 'Sin ...',
                subValue: '${_metodoPagoMasUsado?.totalUsos.toStringAsFixed(1) ?? 0}%',
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: _meses.map((mes) {
                  final bool selected = _selectedMonth.contains(mes);
                  return ChoiceChip(
                    label: Text(mes, style: TextStyle(color: selected ? Colors.white : Colors.black)),
                    selected: selected,
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedMonth = {mes};
                      });
                    },
                    selectedColor: Colors.blue,
                    backgroundColor: Colors.grey[200],
                  );
                }).toList(),
              ),
              _buildChartSection(
                title: 'Top 5 De Ventas',
                dataPoints: _filtrarVentasPorMes(_masVendidosPorMes, mesActual),
              ),
              _buildChartSection(
                title: 'Productos Menos Vendidos',
                dataPoints: _filtrarVentasPorMes(_menosVendidosPorMes, mesActual),
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
