import 'package:flutter/material.dart';
import 'package:imc/core/colores.dart';

class WMedida extends StatefulWidget {
  final void Function(double)? onChangedAltura;

  const WMedida({super.key, this.onChangedAltura});

  @override
  State<WMedida> createState() => _WMedidaState();
}

class _WMedidaState extends State<WMedida> {
  double _valorSlider = 150;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colores.appbarFondo,
          borderRadius: .circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Altura',
              style: TextStyle(
                color: Colores.acento,
                fontSize: 16,
                fontWeight: .bold,
              ),
            ),
            Text(
              '${_valorSlider.toStringAsFixed(2)} cm',
              style: TextStyle(color: Colores.violetaClaro, fontSize: 28),
            ),
            Slider(
              value: _valorSlider,
              activeColor: Colores.violeta,
              label: '${_valorSlider.toStringAsFixed(2)} cm',
              showValueIndicator: ShowValueIndicator.onDrag,
              min: 50,
              max: 225,
              onChanged: (value) => setState(() {
                _valorSlider = value;
                widget.onChangedAltura?.call(_valorSlider);
              }),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
