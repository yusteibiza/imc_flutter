import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';

class WPeso extends StatefulWidget {
  final dynamic peso;
  final Function(double)? onPesoChanged;

  const WPeso({super.key, this.peso, this.onPesoChanged});

  @override
  State<WPeso> createState() => _WPesoState();
}

class _WPesoState extends State<WPeso> {
  Color _colorFondoBoton1 = Colores.violeta;
  Color _colorFondoBoton2 = Colores.violeta;
  late double _peso = 65.0;

  @override
  void initState() {
    super.initState();
    _peso = widget.peso is double ? widget.peso as double : 65;
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
          mainAxisAlignment: .center,
          children: [
            Text(
              'Peso',
              style: TextStyle(color: Colores.acento, fontWeight: .bold),
            ),
            Text(
              '${_peso.toStringAsFixed(2)} Kg',
              style: TextStyle(fontSize: 24, color: Colores.textoSecundario),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Botón menos
                SizedBox(
                  height: 65,
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        _colorFondoBoton2 = Colores.violetaClaro;
                        if (_peso > 0) {
                          _peso -= 0.05;
                          widget.onPesoChanged?.call(_peso);
                        }
                      });
                    },
                    onTap: () {
                      setState(() {
                        _colorFondoBoton2 = Colores.violetaClaro;
                        if (_peso > 0) _peso -= 0.05;
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
                            if (_peso > 0) {
                              _peso -= 0.05;
                              widget.onPesoChanged?.call(_peso);
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
                        if (_peso < 120) {
                          _peso += 0.10;
                          widget.onPesoChanged?.call(_peso);
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
                            if (_peso < 120) {
                              _peso += 0.10;
                              widget.onPesoChanged?.call(_peso);
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
          ],
        )),
      ),
    );
  }
}
