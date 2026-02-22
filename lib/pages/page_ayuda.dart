import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';
import 'package:imc/core/styles.dart';
import 'package:imc/main.dart';

class PageAyuda extends StatelessWidget {
  const PageAyuda({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colores.fondoPrincipal,
      child: Column(
        children: [
          Padding(padding: .all(20)),
          Text('Ayuda', style: Estilos.textos),
          Padding(padding: .all(20)),
          IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                PageRouteBuilder(pageBuilder: (context, _, _) => MainApp()),
              );
            },
            icon: Icon(Icons.reply, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
