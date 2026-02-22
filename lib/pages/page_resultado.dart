import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';

class PageResultado extends StatelessWidget {
  final String? sexo;
  final double altura;
  final int? edad;
  final double peso;

  const PageResultado({
    super.key,
    this.sexo,
    required this.altura,
    this.edad,
    required this.peso,
  });

  @override
  Widget build(BuildContext context) {
    final double altcuadrado = altura * 2;
    final double imc = (peso / altcuadrado);

    return Scaffold(
      backgroundColor: Colores.fondoPrincipal,
      appBar: miAppbar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Column(
            children: [
              Text('... SEXO ...', style: estiloTitulosResultado()),
              Text(sexo ?? 'No especificado', style: estiloTextoResultado()),
              SizedBox(height: 20),
              Text('... ALTURA ...', style: estiloTitulosResultado()),
              Text(altura.toStringAsFixed(2), style: estiloTextoResultado()),
              SizedBox(height: 20),
              Text('... EDAD ...', style: estiloTitulosResultado()),
              Text(edad.toString(), style: estiloTextoResultado()),
              SizedBox(height: 20),
              Text('... PESO ...', style: estiloTitulosResultado()),
              Text(peso.toStringAsFixed(2), style: estiloTextoResultado()),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Divider(height: 2, color: Colores.acento),
              ),
              Spacer(),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colores.appbarElevado,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: double.infinity,
                alignment: .center,
                padding: .all(20),
                margin: .all(60),
                child: Text(
                  !imc.isNaN ? imc.toStringAsFixed(2).substring(2, 4) : '0',
                  style: TextStyle(
                    color: Colores.acento,
                    fontWeight: .bold,
                    fontSize: 90,
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle estiloTextoResultado() => TextStyle(
    color: Colores.textoSecundario,
    fontSize: 26,
    fontWeight: .bold,
  );

  TextStyle estiloTitulosResultado() =>
      TextStyle(color: Colores.textoPrincipal, fontSize: 20, fontWeight: .bold);

  AppBar miAppbar() => AppBar(
    title: Text("Resultado", style: TextStyle(color: Colores.textoPrincipal)),
    backgroundColor: Colores.borde,
  );
}
