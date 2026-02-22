import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';

class WEdad extends StatefulWidget {
  final int? edad;
  final void Function(int)? onChangedEdad;

  const WEdad({super.key, this.edad, this.onChangedEdad});

  @override
  State<WEdad> createState() => _WEdadState();
}

class _WEdadState extends State<WEdad> {
  Color _colorFondoBoton1 = Colores.violeta;
  Color _colorFondoBoton2 = Colores.violeta;
  late int _edad;

  @override
  void initState() {
    super.initState();
    _edad = widget.edad is int ? widget.edad as int : 25;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colores.appbarFondo,
        ),
        width: 185,
        height: 160,
        child: (Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Edad',
              style: TextStyle(color: Colores.acento, fontWeight: .bold),
            ),
            Text(
              _edad.toString(),
              style: TextStyle(fontSize: 24, color: Colores.textoSecundario),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Botón menos
                SizedBox(
                  height: 65,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorFondoBoton2 = Colores.violetaClaro;
                        if (_edad > 0) {
                          _edad--;
                          widget.onChangedEdad?.call(_edad);
                        }
                      });
                    },
                    child: MouseRegion(
                      onExit: (event) {
                        setState(() {
                          _colorFondoBoton2 = Colores.violeta;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: ElevatedButton(
                        focusNode: FocusNode(),
                        onHover: (value) {
                          setState(() {
                            _colorFondoBoton2 = Colores.violetaClaro;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            _colorFondoBoton2,
                          ),
                          iconColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () async {
                          setState(() {
                            _colorFondoBoton2 = Colores.violetaMedio;
                            if (_edad > 0) {
                              _edad--;
                              widget.onChangedEdad?.call(_edad);
                            }
                          });
                          await Future.delayed(Duration(milliseconds: 100));
                          if (!mounted) return;
                          setState(
                            () => _colorFondoBoton2 = Colores.violetaClaro,
                          );
                        },
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10, right: 10)),
                //Botón más
                SizedBox(
                  height: 65,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _colorFondoBoton1 = Colores.violetaClaro;
                        if (_edad < 120) {
                          _edad++;
                          widget.onChangedEdad?.call(_edad);
                        }
                      });
                    },
                    child: MouseRegion(
                      onExit: (event) {
                        setState(() {
                          _colorFondoBoton1 = Colores.violeta;
                        });
                      },
                      cursor: SystemMouseCursors.click,
                      child: ElevatedButton(
                        focusNode: FocusNode(),
                        onHover: (value) {
                          setState(() {
                            _colorFondoBoton1 = Colores.violetaClaro;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            _colorFondoBoton1,
                          ),
                          iconColor: WidgetStatePropertyAll(Colors.white),
                        ),
                        onPressed: () async {
                          setState(() {
                            _colorFondoBoton1 = Colores.violetaMedio;
                            if (_edad < 120) {
                              _edad++;
                              widget.onChangedEdad?.call(_edad);
                            }
                          });
                          await Future.delayed(Duration(milliseconds: 100));
                          if (!mounted) return;
                          setState(
                            () => _colorFondoBoton1 = Colores.violetaClaro,
                          );
                        },
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
        )),
      ),
    );
  }
}
