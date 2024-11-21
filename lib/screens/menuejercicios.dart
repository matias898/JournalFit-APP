import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bench.dart'; // Importa BenchScreen
import 'deadlift.dart'; // Importa DeadliftScreen
import 'squad.dart'; // Importa SquadScreen

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
                        DeadliftScreen(), // Asigna DeadliftScreen a la tarjeta
                      ),
                      _buildExerciseCard(
                        context,
                        'Bench',
                        'lib/assets/bench.jpeg',
                        BenchScreen(), // Asigna BenchScreen a la tarjeta
                      ),
                      _buildExerciseCard(
                        context,
                        'Squad',
                        'lib/assets/squad.jpeg',
                        SquadScreen(), // Asigna SquadScreen a la tarjeta
                      ),
                      _buildExerciseCard(
                        context,
                        'Others...',
                        'lib/assets/others.jpeg',
                        null, // Puedes asignar una pantalla para otros ejercicios
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

  // Función para crear las tarjetas (cards) con imágenes, títulos y navegación
  Widget _buildExerciseCard(BuildContext context, String title, String imagePath, Widget? screen) {
    return GestureDetector(
      onTap: () {
        if (screen != null) {
          // Navega a la pantalla específica del ejercicio
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => screen,
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
