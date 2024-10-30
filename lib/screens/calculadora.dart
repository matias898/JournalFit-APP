import 'package:flutter/material.dart';

class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
  double _repeticionMaxima = 0;

  void _calcularMaxima() {
    double peso = double.tryParse(_pesoController.text) ?? 0;
    int reps = int.tryParse(_repsController.text) ?? 0;

    if (reps > 0 && reps <= 10) {
      _repeticionMaxima = peso / (1.0278 - 0.0278 * reps);
    } else {
      _repeticionMaxima = 0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Navega hacia atrás
          },
        ),
        title: Text('Calculadora Fuerza Máxima', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/gym1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'JournalFit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Peso Levantado (kg)',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _repsController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Repeticiones (1-10)',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calcularMaxima,
                    child: Text('Calcular'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Repetición Máxima: ${_repeticionMaxima.toStringAsFixed(0)} kg',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildPercentageRow(95, 0.95),
                  _buildPercentageRow(90, 0.90),
                  _buildPercentageRow(85, 0.85),
                  _buildPercentageRow(80, 0.80),
                  _buildPercentageRow(75, 0.75),
                  _buildPercentageRow(70, 0.70),
                  _buildPercentageRow(65, 0.65),
                  _buildPercentageRow(60, 0.60),
                  _buildPercentageRow(55, 0.55),
                  _buildPercentageRow(50, 0.50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageRow(int percentage, double multiplier) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$percentage%:',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            '${(_repeticionMaxima * multiplier).toStringAsFixed(0)} kg',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
