// lib/main.dart

import 'package:flutter/material.dart';
import 'screens/calculadora.dart';
import 'screens/perfil.dart';
import 'screens/menuejercicios.dart';
import 'screens/mirutina.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(JournalFitApp());
}

class JournalFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/gym2.jpg'),fit: BoxFit.cover,),), child: Padding(padding: const EdgeInsets.all(16.0), child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Journal',
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                      TextSpan(
                        text: 'Fit ',
                        style: GoogleFonts.kronaOne(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          backgroundColor: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Text(
                'Menu',
                style: GoogleFonts.kronaOne(
                    color: Colors.white,
                    fontSize: 24,
                    backgroundColor: Colors.black54
                ),
              ),
              SizedBox(height: 90,),

              _buildMenuButton(context, 'MI RUTINA', MiRutinaScreen()),
              _buildMenuButton(context, 'EJERCICIOS', EjerciciosScreen()),
              _buildMenuButton(context, 'CALCULADORA', CalculadoraScreen()), // Navega a CalculadoraScreen
              _buildMenuButton(context, 'PERFIL', PerfilScreen()),
              Spacer(),
              TextButton(
                onPressed: () {
                  // Acción para Términos y Condiciones
                },
                child: Text(
                  'Términos y Condiciones',
                  style: TextStyle(color: Colors.white,backgroundColor: Colors.black26),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String text, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        style: ElevatedButton.styleFrom(

          minimumSize: Size(250, 70),
          backgroundColor: Colors.black45.withOpacity(0.5), // Fondo transparente
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.red.shade900,width: 3),
            // Borde rojo
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.kronaOne(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}




