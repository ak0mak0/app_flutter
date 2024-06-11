import 'package:flutter/material.dart';
import 'package:front/pages/qrscreen.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    double extra_top = MediaQuery.of(context).padding.top;
    double extra_bottom = MediaQuery.of(context).padding.bottom;
    double ancho = MediaQuery.of(context).size.width.toDouble();
    double altura = MediaQuery.of(context).size.height.toDouble() - extra_top;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: extra_top,),

            //Texto bienvenida
            Container(
              height: altura*0.19,
              width: ancho,
              color:  Colors.amber,
            ),

            //Buscador
            Container(
              height: altura*0.1,
              width: ancho,
              color:  Colors.blue,
            ),

            SizedBox(height: altura*0.07,),

            //texto sugerencias
            Container(
              width: ancho,
              height: altura*0.05,
              child: Text("Sugerencias"),
            ),
            
            //Sugerencias
            Container(
              alignment: Alignment.center,
              height: altura*0.22,
              width: ancho,
              color:  Colors.white,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: ancho*0.09),
                    Container(
                      alignment: Alignment.center,
                      height: altura*0.22,
                      width: ancho*0.365,
                      color: Colors.lightBlueAccent,
                      child: Text("sugerencia_1"),
                    ),
                    SizedBox(width: ancho*0.09),
                    Container(
                      alignment: Alignment.center,
                      height: altura*0.22,
                      width: ancho*0.365,
                      color: Colors.lightBlueAccent,
                      child: Text("sugerencia_2"),
                    ),
                    SizedBox(width: ancho*0.09),
                    Container(
                      alignment: Alignment.center,
                      height: altura*0.22,
                      width: ancho*0.365,
                      color: Colors.lightBlueAccent,
                      child: Text("sugerencia_1"),
                    ),
                    SizedBox(width: ancho*0.09),
                    Container(
                      alignment: Alignment.center,
                      height: altura*0.22,
                      width: ancho*0.365,
                      color: Colors.lightBlueAccent,
                      child: Text("sugerencia_2"),
                    ),
                    SizedBox(width: ancho*0.09),
                  ],
                ),
              ),
            ),
          
            SizedBox(height: altura*0.06,),

            //texto Categorias Populares
            Container(
              width: ancho,
              height: altura*0.05,
              child: Text("categorias populares"),
            ),

            //Categorias Populares
            Container(
              alignment: Alignment.center,
              height: altura*0.15,
              width: ancho,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: altura*0.08,
                        height: altura*0.08,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                      Text("categoria_1")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: altura*0.08,
                        height: altura*0.08,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                      Text("categoria_2")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: altura*0.08,
                        height: altura*0.08,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                      Text("categoria_3")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: altura*0.08,
                        height: altura*0.08,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onPressed: () {
                          },
                        ),
                      ),
                      Text("categoria_4")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      //bottom bar
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        width: ancho*0.8,
        height: altura*0.1,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 200, 202, 205),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: altura*0.08,
              height: altura*0.08,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onPressed: () {
                },
              ),
            ),

            Container(
              width: altura*0.08,
              height: altura*0.08,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScreen()),
                  );
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}