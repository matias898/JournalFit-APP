import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bench.dart'; // Importa PantallaBench
import 'deadlift.dart'; // Importa PantallaPesoMuerto
import 'squad.dart'; // Importa PantallaSentadilla

class PantallaEjercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym5.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido sobre la imagen de fondo
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
                    childAspectRatio: 1,
                    children: [
                      _construirTarjetaEjercicio(
                        context,
                        'Peso Muerto',
                        'lib/assets/deadlift.jpeg',
                        PantallaPesoMuerto(),
                      ),
                      _construirTarjetaEjercicio(
                        context,
                        'Press Banca',
                        'lib/assets/bench.jpeg',
                        PantallaPressBanca(),
                      ),
                      _construirTarjetaEjercicio(
                        context,
                        'Sentadilla',
                        'lib/assets/squad.jpeg',
                        PantallaSentadilla(),
                      ),
                      _construirTarjetaEjercicio(
                        context,
                        'Otros...',
                        'lib/assets/others.jpeg',
                        null,
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

  // Función para crear las tarjetas con imágenes, títulos y navegación
  Widget _construirTarjetaEjercicio(BuildContext context, String titulo, String rutaImagen, Widget? pantalla) {
    return GestureDetector(
      onTap: () {
        if (pantalla != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => pantalla,
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
                  image: AssetImage(rutaImagen),
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
                  titulo.toUpperCase(),
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
