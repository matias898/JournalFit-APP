import 'package:flutter/material.dart';

class PantallaCalculadora extends StatefulWidget {
  @override
  _EstadoPantallaCalculadora createState() => _EstadoPantallaCalculadora();
}

class _EstadoPantallaCalculadora extends State<PantallaCalculadora> {
  final TextEditingController _controladorPeso = TextEditingController();
  final TextEditingController _controladorRepeticiones = TextEditingController();
  double _repeticionMaximaCalculada = 0;

  void _calcularRepeticionMaxima() {
    double peso = double.tryParse(_controladorPeso.text) ?? 0;
    int repeticiones = int.tryParse(_controladorRepeticiones.text) ?? 0;

    if (repeticiones > 0 && repeticiones <= 10) {
      _repeticionMaximaCalculada = peso / (1.0278 - 0.0278 * repeticiones);
    } else {
      _repeticionMaximaCalculada = 0;
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Calculadora Fuerza Máxima',
          style: TextStyle(color: Colors.white),
        ),
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
                    controller: _controladorPeso,
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
                    controller: _controladorRepeticiones,
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
                    onPressed: _calcularRepeticionMaxima,
                    child: Text('Calcular'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Repetición Máxima: ${_repeticionMaximaCalculada.toStringAsFixed(0)} kg',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  SizedBox(height: 20),
                  _construirFilaPorcentaje(95, 0.95),
                  _construirFilaPorcentaje(90, 0.90),
                  _construirFilaPorcentaje(85, 0.85),
                  _construirFilaPorcentaje(80, 0.80),
                  _construirFilaPorcentaje(75, 0.75),
                  _construirFilaPorcentaje(70, 0.70),
                  _construirFilaPorcentaje(65, 0.65),
                  _construirFilaPorcentaje(60, 0.60),
                  _construirFilaPorcentaje(55, 0.55),
                  _construirFilaPorcentaje(50, 0.50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirFilaPorcentaje(int porcentaje, double multiplicador) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$porcentaje%:',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            '${(_repeticionMaximaCalculada * multiplicador).toStringAsFixed(0)} kg',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
