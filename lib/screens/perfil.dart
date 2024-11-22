import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PantallaPerfil extends StatefulWidget {
  @override
  _EstadoPantallaPerfil createState() => _EstadoPantallaPerfil();
}

class _EstadoPantallaPerfil extends State<PantallaPerfil> {
  final TextEditingController _controladorNombre = TextEditingController(text: "");
  final TextEditingController _controladorEdad = TextEditingController(text: "");
  final TextEditingController _controladorAltura = TextEditingController(text: "");
  final TextEditingController _controladorPeso = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym4.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido sobre la imagen de fondo
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.red),
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior (menú)
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tu Perfil ',
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
                    // Imagen de perfil
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatar_placeholder.png'),
                    ),
                    SizedBox(height: 20),
                    _construirCampoTexto('Nombre', _controladorNombre),
                    SizedBox(height: 20),
                    _construirCampoTexto('Edad', _controladorEdad, keyboardType: TextInputType.number),
                    SizedBox(height: 20),
                    _construirCampoTexto('Altura', _controladorAltura, keyboardType: TextInputType.number),
                    SizedBox(height: 20),
                    _construirCampoTexto('Peso', _controladorPeso, keyboardType: TextInputType.number),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar guardar
                      },
                      child: Text('Guardar'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
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

  // Función para construir los TextFields personalizados
  Widget _construirCampoTexto(String etiqueta, TextEditingController controlador,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controlador,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: etiqueta,
        labelStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.grey[800]?.withOpacity(0.7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
