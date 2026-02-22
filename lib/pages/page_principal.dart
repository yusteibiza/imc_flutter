import 'package:flutter/material.dart';
import 'package:imc/components/w_edad.dart';
import 'package:imc/components/w_generos.dart';
import 'package:imc/components/w_medida.dart';
import 'package:imc/components/w_peso.dart';
import 'package:imc/core/colores.dart';
import 'package:imc/pages/page_resultado.dart';

class PagePrincipal extends StatefulWidget {
  const PagePrincipal({super.key});

  @override
  State<PagePrincipal> createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  // Recoger los valores de los widgets
  int _generoSeleccionado = 0;
  double _altura = 150;
  int _edad = 25;
  double _peso = 65;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colores.fondoSecundario),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colores.fondoSecundario),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          WGeneros(
                            titulo: 'HOMBRE',
                            icono: Icons.male,
                            tamanoIcono: 125,
                            seleccionado: _generoSeleccionado == 0,
                            onTap: () =>
                                setState(() => _generoSeleccionado = 0),
                          ),
                          const SizedBox(width: 18),
                          WGeneros(
                            titulo: 'MUJER',
                            icono: Icons.female,
                            tamanoIcono: 125,
                            seleccionado: _generoSeleccionado == 1,
                            onTap: () =>
                                setState(() => _generoSeleccionado = 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  WMedida(
                    onChangedAltura: (a) {
                      setState(() {
                        _altura = a;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: WEdad(
                            onChangedEdad: (edad) {
                              setState(() {
                                _edad = edad;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: WPeso(
                            onPesoChanged: (p) {
                              setState(() {
                                _peso = p;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton(
                backgroundColor: Colores.acento,
                foregroundColor: Colores.fondoSecundario,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: true,
                      pageBuilder: (context, _, _) => PageResultado(
                        sexo: _generoSeleccionado == 0 ? "HOMBRE" : "MUJER",
                        altura: _altura,
                        edad: _edad,
                        peso: _peso,
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('Resultado', style: TextStyle(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
