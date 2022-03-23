import 'package:conversor_moeda/app/models/moeda_model.dart';
import 'package:flutter/material.dart';

class MoedaBox extends StatelessWidget {
  final List<MoedaModel> itens;
  final MoedaModel itemSelecionado;
  final TextEditingController controller;
  final void Function(MoedaModel) onChanged;

  const MoedaBox(
      {Key key,
      this.itens,
      this.controller,
      this.onChanged,
      this.itemSelecionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<MoedaModel>(
              isExpanded: true,
              value: itemSelecionado,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: itens
                  .map(
                    (item) => DropdownMenuItem(
                      child: Text(item.nome),
                      value: item,
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
