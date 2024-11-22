import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ejercicio {
  String nombre;
  int duracion; // Duración en minutos para mayor claridad
  bool completado;
  Timer? temporizador;
  int tiempoRestante;

  Ejercicio({required this.nombre, required this.duracion, this.completado = false})
      : tiempoRestante = duracion * 60; // Convertir minutos a segundos

  void iniciarTemporizador(void Function() actualizarEstado) {
    if (temporizador != null && temporizador!.isActive) return;
    temporizador = Timer.periodic(Duration(seconds: 1), (temporizador) {
      if (tiempoRestante > 0) {
        tiempoRestante--;
        actualizarEstado();
      } else {
        temporizador!.cancel();
        completado = true;
        actualizarEstado();
      }
    });
  }

  String get tiempoFormateado =>
      "${(tiempoRestante ~/ 60).toString().padLeft(2, '0')}:${(tiempoRestante % 60).toString().padLeft(2, '0')}";
}

class NovatoPantalla extends StatefulWidget {
  @override
  _NovatoPantallaEstado createState() => _NovatoPantallaEstado();
}

class _NovatoPantallaEstado extends State<NovatoPantalla> {
  List<Ejercicio> ejercicios = [
    Ejercicio(nombre: "Caminata", duracion: 1),
    Ejercicio(nombre: "Trote", duracion: 20),
    Ejercicio(nombre: "Bicicleta", duracion: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Journal',
                        style: GoogleFonts.kronaOne(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Fit',
                        style: GoogleFonts.kronaOne(
                          color: Colors.red,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Image.asset(
                'lib/assets/novato.jpg',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'NIVEL NOVATO',
                style: GoogleFonts.kronaOne(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'El nivel Novato es un entrenamiento suave que se enfoca en movilidad y cardio. Técnica básica:',
                style: TextStyle(color: Colors.white70, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              ...ejercicios.map((ejercicio) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _construirElementoEjercicio(ejercicio),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirElementoEjercicio(Ejercicio ejercicio) {
    return ListTile(
      title: Text(ejercicio.nombre, style: TextStyle(color: Colors.white)),
      subtitle: Text(
          ejercicio.completado ? "Completado" : ejercicio.tiempoFormateado,
          style: TextStyle(color: Colors.white70)),
      trailing: IconButton(
        icon: Icon(
          ejercicio.completado ? Icons.check_circle : Icons.timer,
          color: Colors.green,
        ),
        onPressed: () {
          if (!ejercicio.completado) {
            ejercicio.iniciarTemporizador(() {
              setState(() {});
            });
          }
        },
      ),
      tileColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      dense: true,
    );
  }
}
