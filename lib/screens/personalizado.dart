import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Ejercicio {
  String nombre;
  int? repeticiones; // Repeticiones por set para ejercicios de fuerza
  int? series; // Número de series para ejercicios de fuerza
  int duracion; // Duración en minutos para ejercicios de tiempo
  bool completado;

  Timer? temporizador;
  int tiempoRestante;
  bool enPausa;

  Ejercicio({
    required this.nombre,
    this.repeticiones,
    this.series,
    this.duracion = 0,
    this.completado = false,
  })  : tiempoRestante = duracion * 60,
        enPausa = true;

  void iniciarTemporizador(void Function() actualizarEstado) {
    if (temporizador != null && temporizador!.isActive) return;
    enPausa = false;
    temporizador = Timer.periodic(Duration(seconds: 1), (temporizador) {
      if (tiempoRestante > 0) {
        tiempoRestante--;
        actualizarEstado();
      } else {
        temporizador.cancel();
        completado = true;
        actualizarEstado();
      }
    });
  }

  void pausarTemporizador() {
    if (temporizador != null && temporizador!.isActive) {
      temporizador!.cancel();
      enPausa = true;
    }
  }

  String get detalles {
    if (repeticiones != null && series != null) {
      return "$repeticiones reps x $series sets";
    } else {
      final minutos = (tiempoRestante ~/ 60).toString().padLeft(2, '0');
      final segundos = (tiempoRestante % 60).toString().padLeft(2, '0');
      return "$minutos:$segundos";
    }
  }
}

class PantallaPersonalizado extends StatefulWidget {
  @override
  _PantallaPersonalizadoEstado createState() => _PantallaPersonalizadoEstado();
}

class _PantallaPersonalizadoEstado extends State<PantallaPersonalizado> {
  final List<Ejercicio> ejerciciosFuerzaDisponibles = [
    Ejercicio(nombre: "Press de Banca", repeticiones: 10, series: 3),
    Ejercicio(nombre: "Squats", repeticiones: 12, series: 3),
    Ejercicio(nombre: "Peso Muerto", repeticiones: 8, series: 3),
    Ejercicio(nombre: "Press Militar", repeticiones: 10, series: 3),
    Ejercicio(nombre: "Dominadas", repeticiones: 8, series: 3),
  ];

  final List<Ejercicio> ejerciciosCardioDisponibles = [
    Ejercicio(nombre: "Trote en Cinta", duracion: 10),
    Ejercicio(nombre: "Bicicleta Estática", duracion: 15),
    Ejercicio(nombre: "Elíptica", duracion: 12),
    Ejercicio(nombre: "Subir Escaleras", duracion: 8),
    Ejercicio(nombre: "Remo", duracion: 15),
  ];

  List<Ejercicio> rutinaFuerza = [];
  List<Ejercicio> rutinaCardio = [];

  bool mostrarFuerza = false;
  bool mostrarCardio = false;

  void agregarEjercicio(Ejercicio ejercicio, bool esFuerza) {
    setState(() {
      if (esFuerza) {
        rutinaFuerza.add(ejercicio);
      } else {
        rutinaCardio.add(ejercicio);
      }
    });
  }

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
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'lib/assets/personalizado.jpg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Nivel Personalizado',
                style: GoogleFonts.kronaOne(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                'Este nivel permite a los usuarios personalizar completamente su rutina, ajustando los entrenamientos a sus necesidades específicas.',
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              _construirDesplegable(
                "Ejercicios de Fuerza",
                ejerciciosFuerzaDisponibles,
                mostrarFuerza,
                    (nuevoEstado) {
                  setState(() {
                    mostrarFuerza = nuevoEstado;
                  });
                },
                true,
              ),
              SizedBox(height: 10),
              _construirDesplegable(
                "Ejercicios de Cardio",
                ejerciciosCardioDisponibles,
                mostrarCardio,
                    (nuevoEstado) {
                  setState(() {
                    mostrarCardio = nuevoEstado;
                  });
                },
                false,
              ),
              SizedBox(height: 20),
              Text(
                "Tu Rutina Personalizada",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              SizedBox(height: 10),
              ...rutinaFuerza.map((ejercicio) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _construirEjercicioFuerza(ejercicio),
              )),
              ...rutinaCardio.map((ejercicio) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _construirEjercicioCardio(ejercicio),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirEjercicioFuerza(Ejercicio ejercicio) {
    return ListTile(
      title: Text(ejercicio.nombre, style: TextStyle(color: Colors.white)),
      subtitle: Text(ejercicio.detalles, style: TextStyle(color: Colors.white70)),
      trailing: IconButton(
        icon: Icon(
          ejercicio.completado ? Icons.check_circle : Icons.check_circle_outline,
          color: Colors.green,
        ),
        onPressed: () {
          setState(() {
            ejercicio.completado = true;
          });
        },
      ),
      tileColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      dense: true,
    );
  }

  Widget _construirEjercicioCardio(Ejercicio ejercicio) {
    return ListTile(
      title: Text(ejercicio.nombre, style: TextStyle(color: Colors.white)),
      subtitle: Text(ejercicio.detalles, style: TextStyle(color: Colors.white70)),
      trailing: OutlinedButton(
        onPressed: () {
          setState(() {
            if (ejercicio.enPausa) {
              ejercicio.iniciarTemporizador(() {
                setState(() {});
              });
            } else {
              ejercicio.pausarTemporizador();
            }
          });
        },
        child: Text(
          ejercicio.enPausa ? "Iniciar" : "Pausar",
          style: TextStyle(color: Colors.red),
        ),
      ),
      tileColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      dense: true,
    );
  }

  Widget _construirDesplegable(
      String titulo,
      List<Ejercicio> ejercicios,
      bool mostrar,
      ValueChanged<bool> actualizarEstado,
      bool esFuerza,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => actualizarEstado(!mostrar),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titulo,
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              Icon(
                mostrar ? Icons.expand_less : Icons.expand_more,
                color: Colors.red,
              ),
            ],
          ),
        ),
        if (mostrar)
          ...ejercicios.map((ejercicio) => ListTile(
            title: Text(ejercicio.nombre, style: TextStyle(color: Colors.white)),
            subtitle: Text(ejercicio.detalles, style: TextStyle(color: Colors.white70)),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                agregarEjercicio(ejercicio, esFuerza);
              },
              child: Text("Agregar", style: TextStyle(color: Colors.white)),
            ),
            tileColor: Colors.grey[800],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),
      ],
    );
  }
}
