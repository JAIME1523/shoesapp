import 'package:flutter/material.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/widgets/custom_widgest.dart';

class ZaptoPage extends StatelessWidget {
  const ZaptoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusdark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppAbar(
            texto: 'For you',
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  SizedBox(height: 10),
                  Hero(tag: 'zapato-1', child: ZapatoSizedPreview()),
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                ],
              ),
            ),
          ),
          const AgregarCarritoBoton(monto: 180.0),
        ],
      ),
    );
  }
}
