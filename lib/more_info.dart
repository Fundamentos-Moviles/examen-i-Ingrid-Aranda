import 'package:flutter/material.dart';
import 'package:examen_i_avis/utils/constants.dart' as con;

class More_Info extends StatefulWidget {
  const More_Info({super.key});

  @override
  State<More_Info> createState() => _More_InfoState();
}

class _More_InfoState extends State<More_Info> {
  int cont = 0;
  List<List<Widget>> filasList = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
                children: [
                SizedBox(height: 15.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: con.botones,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    fixedSize: Size(size.width/1.7, 35),
                  ),
                  onPressed: (){
                    setState(() {
                      cont++;
                      int numMaxporFila = cont <= 12 ? cont : 12;
                      filasList.clear();
                      int numContenedores = 0;
                      while (numContenedores < cont) {
                        int contsFila = (cont - numContenedores >= numMaxporFila) ? numMaxporFila : cont - numContenedores;
                        List<Widget> filaActual = [];
                        for (int i = 0; i < contsFila; i++) {
                          filaActual.add(
                            Container(
                              margin: EdgeInsets.only(top: 10.0),
                              width: size.width / contsFila,
                              height: 200.0,
                              color: ((numContenedores + i) % 2 == 0) ? con.efectos : con.fondo2,
                            ),
                          );
                        }
                        filasList.add(filaActual);
                        numContenedores += contsFila;
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: con.text,
                        ),
                      ),
                    ],
                  ),
                ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: filasList.map((row) {
                          return Wrap(
                            alignment: WrapAlignment.center,
                            children: row,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
            ]
          )
          )
        ],
      ),
    );
  }
}
