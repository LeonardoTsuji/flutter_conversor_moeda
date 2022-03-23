import 'package:conversor_moeda/app/components/moeda_box.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController deTexto = TextEditingController();

  final TextEditingController paraTexto = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(deTexto: deTexto, paraTexto: paraTexto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: ListView(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              MoedaBox(
                itemSelecionado: homeController.deMoeda,
                controller: deTexto,
                itens: homeController.moedas,
                onChanged: (moeda) {
                  setState(() {
                    homeController.deMoeda = moeda;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              MoedaBox(
                itemSelecionado: homeController.paraMoeda,
                controller: paraTexto,
                itens: homeController.moedas,
                onChanged: (moeda) {
                  setState(() {
                    homeController.paraMoeda = moeda;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.amber,
                child: Text('CONVERTER'),
                onPressed: () {
                  homeController.converter();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
