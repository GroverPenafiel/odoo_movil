import 'package:flutter/material.dart';

class CSBPCargando extends StatelessWidget {
  final bool cargando;
  final Color colorCirculoCargando;
  final bool usarColorCirculoCargando;

  const CSBPCargando(
      {Key? key,
      required this.cargando,
      this.colorCirculoCargando = Colors.black87,
      this.usarColorCirculoCargando = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorPorDefecto = Theme.of(context).accentColor;
    return Positioned.fill(
        child: cargando
            ? Container(
                color: Colors.black12,
                child: Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            this.usarColorCirculoCargando
                                ? this.colorCirculoCargando
                                : colorPorDefecto))))
            : const SizedBox.shrink());
  }
}
