import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';
import 'package:imc/core/styles.dart';

class WGeneros extends StatefulWidget {
  final String? titulo;
  final IconData? icono;
  final double? tamanoIcono;
  final bool seleccionado;
  final VoidCallback? onTap;

  const WGeneros({
    super.key,
    this.titulo,
    this.icono,
    this.tamanoIcono,
    this.seleccionado = false,
    this.onTap,
  });

  @override
  State<WGeneros> createState() => _WGenerosState();
}

class _WGenerosState extends State<WGeneros> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 18),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                color: widget.seleccionado
                    ? Colores.violeta
                    : Colores.appbarFondo,
              ),
              child: SizedBox(
                height: 200,
                child: Column(
                  mainAxisAlignment: .center,
                  spacing: 5,
                  children: [
                    Icon(
                      widget.icono ?? Icons.person,
                      color: widget.seleccionado
                          ? Colores.fondoPrincipal
                          : Colores.violeta,
                      size: widget.tamanoIcono ?? 48,
                    ),
                    Text(widget.titulo ?? 'Hombre', style: Estilos.iconos),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
