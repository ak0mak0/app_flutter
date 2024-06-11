import 'package:flutter/material.dart';
import 'package:front/pages/principal.dart';
import 'package:front/pages/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:front/functions.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Importa flutter_spinkit

class Loggin extends StatefulWidget {
  const Loggin({super.key});

  @override
  State<Loggin> createState() => _IngresoState();
}

class _IngresoState extends State<Loggin> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final result = await APIService.login(_username.text, _password.text);
      if (result.containsKey('_id')) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Principal()),
        );
      } 
      else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(result['error'])),
        );
      }
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Nombre de usuario o contraseña incorrectos')),
      );
    } 
    finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double extra_top = MediaQuery.of(context).padding.top;
    // double extra_bottom = MediaQuery.of(context).padding.bottom;
    double ancho = MediaQuery.of(context).size.width.toDouble();
    double altura = MediaQuery.of(context).size.height.toDouble() - extra_top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: extra_top,),
            Container(width: ancho, height: altura * 0.1,),

            Row(
              children: [
                SizedBox(width: ancho * 0.05,),
                Text("Iniciar Sesion", style: GoogleFonts.poppins(
                  color: const Color.fromRGBO(41, 52, 65, 1),
                  fontSize: altura * 0.04,
                  fontWeight: FontWeight.w600)
                ),
              ],
            ),
            
            SizedBox(height: altura * 0.05,),
            // USERNAME
            Row(
              children: [
                SizedBox(width: ancho * 0.05,),
                Text("USERNAME :", style: GoogleFonts.poppins(
                  color: Color.fromRGBO(41, 52, 65, 1),
                  fontSize: altura * 0.021,
                  fontWeight: FontWeight.w600)
                ),
              ],
            ),

            SizedBox(height: altura * 0.01,),
            
            Container(
              alignment: Alignment.center,
              width: ancho * 0.9,
              height: altura * 0.07,
              decoration: BoxDecoration(
                color: Color.fromRGBO(235, 239, 242, 1),
                borderRadius: BorderRadius.circular(30)
              ),

              child: TextField(
                enabled: !_isLoading, // Deshabilitar durante carga
                controller: _username,
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "Ingrese un nombre de ususario",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
            ),
     
            
            SizedBox(height: altura * 0.02,),

            Row(
              children: [
                SizedBox(width: ancho * 0.05,),
                Text("CONTRASEÑA :", style: GoogleFonts.poppins(
                  color: Color.fromRGBO(41, 52, 65, 1),
                  fontSize: altura * 0.021,
                  fontWeight: FontWeight.w600)
                ),
              ],
            ),
            
            SizedBox(height: altura * 0.01,),

            Container(
              alignment: Alignment.center,
              width: ancho * 0.9,
              height: altura * 0.07,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(235, 239, 242, 1),
                borderRadius: BorderRadius.circular(30)
              ),
              child: TextField(
                enabled: !_isLoading, // Deshabilitar durante carga
                controller: _password,
                maxLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  hintText: "********",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.white,
                    )
                  ),
                ),
              ),
            ),

            SizedBox(height: altura * 0.05,),

            Container(
              width: ancho * 0.9,
              height: altura * 0.065,
              child: FloatingActionButton(
                heroTag: 'Iniciar sesion',
                backgroundColor: Color.fromRGBO(230, 87, 56, 1),
                elevation: 0,
                onPressed: _isLoading ? null : _login,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23))),
                child: _isLoading
                    ? SpinKitThreeBounce(
                        color: Colors.white,
                        size: 20.0,
                      )
                    : const Text("Ingresar", style: TextStyle(color: Colors.white)),
              ),
            ),
          
          ],
        ),
      ),

      bottomNavigationBar: Container(
        width: ancho * 0.8,
        height: altura * 0.05,
        child: FloatingActionButton(
          heroTag: 'registro',
          backgroundColor: Colors.white,
          elevation: 0,
          onPressed: _isLoading ? null : () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Register()),
            );
          },
          child: const Text("No tienes una cuenta? Registrate ahora", style: TextStyle(color: Color.fromRGBO(41, 52, 65, 1))),
        ),
      ),
    );
  }
}