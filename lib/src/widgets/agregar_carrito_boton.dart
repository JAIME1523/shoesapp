import 'package:flutter/material.dart';
import 'package:shoesapp/src/widgets/custom_widgest.dart';

class AgregarCarritoBoton extends StatelessWidget {
  const AgregarCarritoBoton({Key? key, required this.monto}) : super(key: key);
  final double monto;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(100)),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Text('\$ $monto',
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const Spacer(),
            const BotonNaranja(text: 'Add to cart'),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
