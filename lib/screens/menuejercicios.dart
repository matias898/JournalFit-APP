// lib/ejercicios.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bench.dart'; // Importa BenchScreen aquí

class EjerciciosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym5.jpg"), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido sobre la imagen de fondo
          Column(
            children: [
              // AppBar personalizado
              AppBar(
                backgroundColor: Colors.transparent, // Fondo transparente
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.red),
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior
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
              SizedBox(height: 10),
              Center(
                child: Text(
                  'EJERCICIOS',
                  style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Grid de ejercicios
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1, // Aspecto cuadrado para las cards
                    children: [
                      _buildExerciseCard(
                        context,
                        'Deadlift',
                        'lib/assets/deadlift.jpeg',
                      ),
                      _buildExerciseCard(
                        context,
                        'Bench',
                        'lib/assets/bench.jpeg',
                      ),
                      _buildExerciseCard(
                        context,
                        'Squad',
                        'lib/assets/squad.jpeg',
                      ),
                      _buildExerciseCard(
                        context,
                        'Others...',
                        'lib/assets/others.jpeg',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Función para crear las tarjetas (cards) con imágenes y títulos
  Widget _buildExerciseCard(BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == 'Bench') {
          // Si el título es "Bench", navega a BenchScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BenchScreen(),
            ),
          );
        } else {
          // Para otros ejercicios, navega a ExerciseDetailScreen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ExerciseDetailScreen(title: title),
            ),
          );
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Stack(
          children: [
            // Imagen de la tarjeta
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Título del ejercicio
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de detalles del ejercicio
class ExerciseDetailScreen extends StatelessWidget {
  final String title;

  const ExerciseDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Detalles del ejercicio: $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
