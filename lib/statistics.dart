import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<Statistics> {
  
  Set<String> _selectedMonth = {'Junio'}; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], 
      appBar: AppBar(
        backgroundColor: Colors.blue, 
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),
        title: const Text(
          'Estadisticas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView( 
        child: Column(
          children: [
            const SizedBox(height: 20),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildInfoCard(
                      label: 'El producto mas vendido',
                      value: 'Nombre producto',
                      subValue: 'Mas de 100 unidades\nvendidas', 
                    ),
                  ),
                  const SizedBox(width: 16), 
                  Expanded(
                    child: _buildInfoCard(
                      label: 'El metodo de pago\nmayor usado', 
                      value: 'Tarjeta de credito',
                      subValue: '68% de las\ntransacciones', 
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(5.0), 
                child: Center( 
                  child: SegmentedButton<String>(
                    segments: const <ButtonSegment<String>>[
                      ButtonSegment<String>(
                        value: 'Marzo',
                        label: Text('Marzo'),
                      ),
                      ButtonSegment<String>(
                        value: 'Abril',
                        label: Text('Abril'),
                      ),
                      ButtonSegment<String>(
                        value: 'Mayo',
                        label: Text('Mayo'),
                      ),
                      ButtonSegment<String>(
                        value: 'Junio',
                        label: Text('Junio'),
                      ),
                    ],
                    selected: _selectedMonth,
                    onSelectionChanged: (Set<String> newSelection) {
                      setState(() {
                        _selectedMonth = newSelection;
                        
                        print('Mes seleccionado: ${_selectedMonth.first}');
                      });
                    },
                    showSelectedIcon: false,
                    style: SegmentedButton.styleFrom(
                      foregroundColor: Colors.grey[700],
                      selectedForegroundColor: Colors.white, 
                      selectedBackgroundColor: Colors.blue, 
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            
            _buildChartSection(
              title: 'Top 5 De Ventas',
              
              dataPoints: {
                'Ene': 8, 'Feb': 5, 'Mar': 12, 'Apr': 7, 'May': 10, 'Jun': 6,
              },
              maxHeight: 15.0, 
            ),
            const SizedBox(height: 30),

            _buildChartSection(
              title: 'Productos Menos Vendidos',
              dataPoints: {
                'Ene': 6, 'Feb': 9, 'Mar': 4, 'Apr': 8, 'May': 5, 'Jun': 7,
              },
              maxHeight: 15.0,
              chartColor: Colors.lightBlue[300], 
            ),
            const SizedBox(height: 30), 
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para las tarjetas de información principal
  Widget _buildInfoCard({
    required String label,
    required String value,
    required String subValue,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto a la izquierda
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subValue,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para las secciones de gráficos
  Widget _buildChartSection({
    required String title,
    required Map<String, double> dataPoints, // Mes y altura relativa de la barra
    required double maxHeight,
    Color? chartColor, // Color opcional para las barras
  }) {
    // Determinar el color base para el gráfico, por defecto azul
    final baseChartColor = chartColor ?? Colors.blue;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          // Eje Y (simulado con Text y Column)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end, // Alinea los elementos al final (abajo)
            children: [
              // Escala del eje Y
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('15K', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 8), // Ajustar según el espaciado de las barras
                  Text('10K', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('5K', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('1k', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 8),
                  Text('0', style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(width: 10), // Espacio entre el eje Y y las barras

              // Barras del gráfico
              Expanded(
                child: SizedBox(
                  height: 120, // Altura fija para el área del gráfico
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end, // Alinea las barras desde abajo
                    children: dataPoints.entries.map((entry) {
                      final month = entry.key;
                      final value = entry.value; // Valor relativo para la altura
                      // Calcula la altura de la barra proporcionalmente
                      final barHeight = (value / maxHeight) * 100; // Multiplica por altura máxima deseada de la barra
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 18, // Ancho de la barra
                            height: barHeight, // Altura dinámica de la barra
                            decoration: BoxDecoration(
                              color: baseChartColor, // Color de la barra
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(month, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}