import 'package:flutter/material.dart';
import 'package:examen_i_avis/utils/constants.dart' as con;

class More_Info extends StatefulWidget {
  const More_Info({super.key});

  @override
  State<More_Info> createState() => _More_InfoState();
}

class _More_InfoState extends State<More_Info> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: con.botones,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              fixedSize: Size(size.width/1.7, 35),
            ),
            onPressed: (){
              ///validaUser();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                  ),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
