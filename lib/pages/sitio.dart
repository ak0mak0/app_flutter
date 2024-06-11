import 'package:flutter/material.dart';

class Sitio extends StatelessWidget {
  final Map<String, dynamic> sitioData;

  const Sitio({Key? key, required this.sitioData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle del Sitio'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sitioData['nombre'] ?? 'Nombre no disponible',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              sitioData['descripcion'] ?? 'Descripción no disponible',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Ubicación: ${sitioData['ubicacion'] ?? 'Ubicación no disponible'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Horario: ${sitioData['horario'] ?? 'Horario no disponible'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            sitioData['imagenUrl'] != null
                ? Image.network(sitioData['imagenUrl'])
                : Container(),
          ],
        ),
      ),
    );
  }
}
