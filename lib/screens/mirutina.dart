// lib/screens/mirutina.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiRutinaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym1.jpg"), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // AppBar personalizado
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
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Journal',
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: 'Fit',
                        style: GoogleFonts.kronaOne(
                          color: Colors.red,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    _buildLevelCard(
                      context,
                      'NOVATO',
                      'Entrenamientos suaves\nMovilidad, cardio...',
                      'lib/assets/novato.jpg',
                    ),
                    _buildLevelCard(
                      context,
                      'INTERMEDIO',
                      'Entrenamientos normales\nCalistenia, HIIT...',
                      'lib/assets/intermedio.jpg',
                    ),
                    _buildLevelCard(
                      context,
                      'AVANZADO',
                      'Entrenamientos intensos\nPesos libres, streetlift...',
                      'lib/assets/avanzado.jpg',
                    ),
                    _buildLevelCard(
                      context,
                      'PERSONALIZADO',
                      'Tú eres responsable.\nOrganiza a tu gusto.',
                      'lib/assets/personalizado.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelCard(BuildContext context, String title, String description, String imagePath) {
    return Padding(
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
              // Texto (Título y descripción)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              // Imagen circular
              ClipOval(
                child: Image.asset(
                  imagePath,
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
