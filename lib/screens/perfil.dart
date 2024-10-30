// lib/perfil.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final TextEditingController _nombreController =
  TextEditingController(text: "");
  final TextEditingController _edadController =
  TextEditingController(text: "");
  final TextEditingController _alturaController =
  TextEditingController(text: "");
  final TextEditingController _pesoController =
  TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/gym4.jpg"), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Contenido sobre la imagen de fondo
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // Fondo transparente
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.red),
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior (menu)
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
                    // Imagen de perfil (puedes cambiarla a una imagen real si quieres)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatar_placeholder.png'),
                    ),
                    SizedBox(height: 20),
                    _buildTextField('Nombre', _nombreController),
                    SizedBox(height: 20),
                    _buildTextField('Edad', _edadController, keyboardType: TextInputType.number),
                    SizedBox(height: 20),
                    _buildTextField('Altura', _alturaController, keyboardType: TextInputType.number),
                    SizedBox(height: 20),
                    _buildTextField('Peso', _pesoController, keyboardType: TextInputType.number),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Acción al presionar guardar (puedes implementar el guardado de datos aquí)
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
  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
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
