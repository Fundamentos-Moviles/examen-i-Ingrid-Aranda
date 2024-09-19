import 'package:examen_i_avis/more_info.dart';
import 'package:flutter/material.dart';
import 'package:examen_i_avis/utils/constants.dart' as con;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List lista;
  void initState() {
    lista = List.from(con.listaExamen);
    //Todo:implement initState
    super.initState();
  }

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
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
                children: [
                  SizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: size.width/1.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: con.text
                    ),
                    child: Text(
                      'Notificaciones de Actividades',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: con.titulos,
                      ),
                    ),
                  ), ///Titulo
                  SizedBox(height: 15.0),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        var datos = lista[index].toString().split('#');
                        return ((int.parse(datos[0])%2)==0) ? card2(int.parse(datos[0]), datos[1], datos[2], datos[3], datos[4],size, index
                        ) : card(size: size, numero: datos[1], titulo: datos[2], descripcion: datos[3], numEstrellas: datos[4], id: int.parse(datos[0]),);
                      },
                    ),
                  ), ///Generacion de Cards
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: size.width,
                    decoration: BoxDecoration(
                        color: con.fondo2,
                    ),
                    child: Text(
                      'SEGUNDA VISTA: ARANDA_VAZQUEZ_INGRID_SAYURI',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: con.titulos,
                      ),
                    ),
                  ), ///Nombre
                ],
              ),
          )
        ],
      ),
    );
  }

  Container card2(int id, String numero, String titulo, String descripcion, String numEstrellas, size, index)
  {
    return Container(
      child: Row(
        children: [
          Expanded(
              flex:4,child: card(size: size, numero: numero, titulo: titulo, descripcion: descripcion, numEstrellas: numEstrellas, id: id)),
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.all(10.0),
                width: size.width/1.03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(100, 30),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>More_Info()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: con.text, size: 10,),
                          Text(
                            ' Ver más',
                            style: TextStyle(
                              fontSize: 10,
                              color: con.text,
                            ),
                          )
                        ],
                      ),
                    ), ///Boton ver mas
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: con.botones,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        fixedSize: Size(100, 30),
                      ),
                      onPressed: (){
                        if(numero == '10')
                          {
                            showSnackBar('Se elimino el elemento con el ID: $id', 5);
                          }else{
                        setState((){
                          lista.removeAt(index);
                          showSnackBar('Se elimino el elemento con el ID: $id', 5);
                        });}
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, color: con.text, size: 10,),
                          Text(
                            'Borrar',
                            style: TextStyle(
                              fontSize: 10,
                              color: con.text,
                            ),

                          )
                        ],
                      ),
                    ), ///Boton Borrar
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
  void showSnackBar(String texto, int duracion)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          texto,
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: duracion),
        ),
        );
  }
}

class card extends StatelessWidget {
  final int id;
  final String numero;
  final String titulo;
  final String descripcion;
  final String numEstrellas;
  const card({
    super.key,
    required this.size, required this.numero, required this.titulo, required this.descripcion, required this.numEstrellas, required this.id
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      width: size.width/1.03,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: con.text,
      ),
      child: InkWell(
        onTap: (){
          if((id%2)!=0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => More_Info()));
          }
        },
        child: Column(
          children: [
            Row(
              children: [
                Expanded(flex: 2, child: Text(numero, style: TextStyle( fontSize: 20, color: con.fondo2),)),
                Expanded(flex: 0, child: Icon(Icons.eco_outlined, color: con.efectos,)),
              ],
            ),
            Row(
              children: [
                Expanded(
                   flex: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(titulo),
                        Text(descripcion, style: TextStyle( color: con.txtDes),),
                      ],
                    )
                ),
                Spacer(),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color: index < int.parse(numEstrellas) ? con.efectos : con.txtDes,
                      size: 16,
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
