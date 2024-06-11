import 'package:flutter/material.dart';
import 'package:front/functions.dart';

class Sitios extends StatefulWidget {
  const Sitios({Key? key}) : super(key: key);

  @override
  State<Sitios> createState() => _SitiosState();
}

class _SitiosState extends State<Sitios> {
  late Future<List<dynamic>> sitios;


  // para ejecutar funcion al ingreesar a la pagina
  @override
  void initState() {
    super.initState();
    sitios = APIService.fetchSitios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sitios'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: sitios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay sitios disponibles'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final sitio = snapshot.data![index];
                return ListTile(
                  title: Text(sitio['nombre_sitio']),
                  subtitle: Text('Latitud: ${sitio['latitud']}, Longitud: ${sitio['longitud']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
