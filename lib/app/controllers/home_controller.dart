import 'package:conversor_moeda/app/models/moeda_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<MoedaModel> moedas;

  final TextEditingController deTexto;
  final TextEditingController paraTexto;

  MoedaModel deMoeda;
  MoedaModel paraMoeda;

  HomeController({this.deTexto, this.paraTexto}) {
    moedas = MoedaModel.getMoedas();
    deMoeda = moedas[0];
    paraMoeda = moedas[1];
  }

  void converter() {
    String text = deTexto.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double textTotal = 0;

    if (paraMoeda.nome == 'Real') {
      textTotal = value * deMoeda.real;
    } else if (paraMoeda.nome == 'Dolar') {
      textTotal = value * deMoeda.dolar;
    } else if (paraMoeda.nome == 'Euro') {
      textTotal = value * deMoeda.euro;
    } else if (paraMoeda.nome == 'Bitcoin') {
      textTotal = value * deMoeda.bitcoin;
    }

    paraTexto.text = textTotal.toStringAsFixed(2);
  }
}
