import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:conversor_moeda/app/models/moeda_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController deTexto = TextEditingController();
  final TextEditingController paraTexto = TextEditingController();
  final homeController = HomeController(deTexto: deTexto, paraTexto: paraTexto);

  test('Deve converter de Real para Dolar com vírgula', () {
    deTexto.text = '2,0';
    homeController.converter();
    expect(paraTexto.text, '0.36');
  });
  test('Deve converter de Real para Dolar com ponto', () {
    deTexto.text = '2.0';
    homeController.converter();
    expect(paraTexto.text, '0.36');
  });
  test('Deve converter de Dolar para Real', () {
    deTexto.text = '1.0';
    homeController.deMoeda = MoedaModel(
        nome: 'Dolar', real: 5.65, dolar: 1, euro: 0.85, bitcoin: 0.000088);
    homeController.paraMoeda = MoedaModel(
        nome: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016);
    homeController.converter();
    expect(paraTexto.text, '5.65');
  });
}
