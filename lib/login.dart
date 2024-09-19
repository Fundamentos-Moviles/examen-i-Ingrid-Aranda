import 'package:flutter/material.dart';
import 'package:examen_i_avis/utils/constants.dart' as con;
import 'package:examen_i_avis/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController();
  final pass = TextEditingController();
  String mensajeError = '';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: con.fondo2,
          ), ///Fondo
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: contenedorFondo(size: size, color: con.fondo),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo2),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo3),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo4),)
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: contenedorFondo(size: size, color: con.fondo4),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo3),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo2),)
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: contenedorFondo(size: size, color: con.fondo3),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo4),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo2),),
                    Expanded(child: contenedorFondo(size: size, color: con.fondo),)
                  ],
                ),
              ],
            ),
          ), ///Fondo de Contenedores
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: size.width/1.30,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Bienvenido a tu primer EXAMEN',
                    style: TextStyle(
                      color: con.titulos,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: usuario,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Correo/Usuario',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          width: 5,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          width: 1.2,
                          color: Colors.black,
                        )
                      )
                    ),
                  ), ///Usuario
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: pass,
                    autofocus: true,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Contraseña',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              width: 5,
                              color: Colors.grey,
                              style: BorderStyle.solid,
                            )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              width: 1.2,
                              color: Colors.black,
                            )
                        )
                    ),
                  ),///Contraseña
                  SizedBox(height: 20.0),
                  if(mensajeError.isNotEmpty)
                    Text(
                      mensajeError,
                      style: TextStyle(
                        color: con.mensajeError, fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ), ///Mensaje de Error
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: con.botones,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      fixedSize: Size(size.width/1.7, 35),
                    ),
                    onPressed: (){
                      validaUser();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: con.text,
                          ),

                        )
                      ],
                    ),
                  ), ///Boton
                  SizedBox(height: 30.0),
                  Text(
                    'Mi primer examen, ¿estará sencillo?',
                    style: TextStyle(
                      color: con.text,
                    ),
                  )
                ],
              ),
            ),
          ) ///Formulario
        ],
      ),
    );
  }

  void validaUser()
  {
    setState(() {
      if(usuario.text.isEmpty && pass.text.isEmpty){
        mensajeError='Datos Incompletos';
      } else if(usuario.text != 'test' && pass.text != 'FDM1') {
        mensajeError='Usuario y contraseña incorrectos';
      } else if(usuario.text == 'test' && pass.text != 'FDM1') {
        mensajeError='Contraseña incorrecta';
      }else if(usuario.text != 'test' && pass.text == 'FDM1') {
        mensajeError='Usuario incorrecto';
      }else if(usuario.text == 'test' && pass.text == 'FDM1') {
        mensajeError='Ingreso correctamente';
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
    });
  }
}

class contenedorFondo extends StatelessWidget {
  final Color color;
  const contenedorFondo({
    super.key,
    required this.size, required this.color,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
      ),
      height: size.height/3,
    );
  }
}
