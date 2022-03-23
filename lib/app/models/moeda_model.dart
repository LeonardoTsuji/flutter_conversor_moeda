class MoedaModel {
  final String nome;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  MoedaModel({this.nome, this.real, this.dolar, this.euro, this.bitcoin});

  static List<MoedaModel> getMoedas() {
    return <MoedaModel>[
      MoedaModel(
          nome: 'Real', real: 1.0, dolar: 0.18, euro: 0.15, bitcoin: 0.000016),
      MoedaModel(
          nome: 'Dolar', real: 5.65, dolar: 1, euro: 0.85, bitcoin: 0.000088),
      MoedaModel(
          nome: 'Euro', real: 6.62, dolar: 1.17, euro: 1, bitcoin: 0.00010),
      MoedaModel(
          nome: 'Bitcoin',
          real: 64116.51,
          dolar: 11351.30,
          euro: 9689.54,
          bitcoin: 1),
    ];
  }
}
