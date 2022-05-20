import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatoSizedPreview extends StatelessWidget {
  const ZapatoSizedPreview({Key? key, this.fullScreen = false})
      : super(key: key);
  final bool fullScreen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !fullScreen
          ? () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const ZapatoDescPage())));
            }
          : () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (fullScreen) ? 5 : 30, vertical: fullScreen ? 0 : 5),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410 : 430,
          decoration: BoxDecoration(
              color: const Color(0XffFFCF53),
              borderRadius: (!fullScreen)
                  ? BorderRadius.circular(50)
                  : const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
          child: Column(
            children: [
              //zapatp con sombrea

              const _ZapatoConSombra(),
              //todas las  tallas

              if (!fullScreen) const _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TallasZapatoCaja(
            numero: 7,
          ),
          _TallasZapatoCaja(
            numero: 7.5,
          ),
          _TallasZapatoCaja(
            numero: 8,
          ),
          _TallasZapatoCaja(
            numero: 8.5,
          ),
          _TallasZapatoCaja(
            numero: 9,
          ),
          _TallasZapatoCaja(
            numero: 9.5,
          ),
        ],
      ),
    );
  }
}

class _TallasZapatoCaja extends StatelessWidget {
  const _TallasZapatoCaja({
    Key? key,
    required this.numero,
  }) : super(key: key);
  final double numero;
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return GestureDetector(
      onTap: () {
        var zapatoModel2 = Provider.of<ZapatoModel>(context, listen: false);
        zapatoModel2.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (numero == zapatoModel.talla)
              ? const Color(0xffF1A23A)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (numero == 9)
              const BoxShadow(
                  color: Color(0xffF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5))
          ],
        ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == zapatoModel.talla)
                  ? Colors.white
                  : const Color(0XFFf1A23A),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  const _ZapatoConSombra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children:  [
          const Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
          Image(
            image: AssetImage(zapatoModel.assetImage),
          ),
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  const _ZapatoSombra({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xffEAA14E), blurRadius: 40)
            ]),
      ),
    );
  }
}
