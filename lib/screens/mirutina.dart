// lib/screens/mirutina.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'novato.dart';
import 'intermedio.dart';
import 'avanzado.dart';
import 'personalizado.dart';

class PantallaMiRutina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _construirTarjetaNivel(
                        context,
                        'NOVATO',
                        'Entrenamientos suaves\nMovilidad, cardio...',
                        'lib/assets/novato.jpg',
                        NovatoPantalla()),
                    _construirTarjetaNivel(
                        context,
                        'INTERMEDIO',
                        'Entrenamientos normales\nCalistenia, HIIT...',
                        'lib/assets/intermedio.jpg',
                        IntermedioPantalla()),
                    _construirTarjetaNivel(
                        context,
                        'AVANZADO',
                        'Entrenamientos intensos\nPesos libres, streetlift...',
                        'lib/assets/avanzado.jpg',
                        PantallaAvanzado()),
                    _construirTarjetaNivel(
                        context,
                        'PERSONALIZADO',
                        'Tú eres responsable.\nOrganiza a tu gusto.',
                        'lib/assets/personalizado.jpg',
                        PantallaPersonalizado()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _construirTarjetaNivel(BuildContext context, String titulo, String descripcion, String rutaImagen, Widget paginaSiguiente) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => paginaSiguiente),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Card(
          color: Colors.grey.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        titulo,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        descripcion,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ClipOval(
                  child: Image.asset(
                    rutaImagen,
                    width: 180,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
