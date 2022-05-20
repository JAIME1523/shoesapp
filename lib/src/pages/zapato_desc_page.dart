import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/helpers/helpers.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/widgets/custom_widgest.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLigth();
    return Scaffold(
        body: Column(
      children: [
        Stack(children: [
          const Hero(
              tag: 'zapato-1',
              child: ZapatoSizedPreview(fullScreen: true)),
          Positioned(
            top: 50,
            child: FloatingActionButton(
              elevation: 0,
              highlightElevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                cambiarStatusdark();
                Navigator.pop(context);
              },
              child:
                  const Icon(Icons.chevron_left, color: Colors.white, size: 60),
            ),
          )
        ]),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              ZapatoDescripcion(
                titulo: 'Nike Air Max 720',
                descripcion:
                    "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
              ),
              _MontoBoyNow(),
              SizedBox(
                  height: 150, width: double.infinity, child: _ColoresYmas()),
              _BotonesLikeCartSettings(),
            ],
          ),
        ))
      ],
    ));
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _BotonSombreado(
            icon: Icon(
              Icons.heart_broken,
              color: Colors.red,
              size: 25,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _BotonSombreado(
            icon: Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  const _BotonSombreado({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
      child: icon,
    );
  }
}

class _ColoresYmas extends StatelessWidget {
  const _ColoresYmas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
              child: Stack(
            children: const [
              Positioned(
                left: 90,
                child: _BotonColor(
                    color: Color(0Xffc6d642),
                    index: 4,
                    url: 'assets/verde.png'),
              ),
              Positioned(
                left: 60,
                child: _BotonColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    url: 'assets/amarillo.png'),
              ),
              Positioned(
                left: 30,
                child: _BotonColor(
                    color: Color(0Xff2099F1), index: 2, url: 'assets/azul.png'),
              ),
              Positioned(
                child: _BotonColor(
                  color: Color(0Xff364D56),
                  index: 1,
                  url: 'assets/negro.png',
                ),
              ),
            ],
          )),
          const BotonNaranja(
              text: 'More releated items',
              alto: 30,
              ancho: 170,
              color: Color(0xffFFC675))
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
    this.url = '',
  }) : super(key: key);
  final Color color;
  final int index;
  final String url;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 200),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoMdel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoMdel.assetImage = url;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _MontoBoyNow extends StatelessWidget {
  const _MontoBoyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text('\$ 180',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                )),
            const Spacer(),
            Bounce(
                delay:const  Duration(seconds: 1),
                from: 8,
                child:const  BotonNaranja(ancho: 120, alto: 40, text: 'Buy Now'))
          ],
        ),
      ),
    );
  }
}
