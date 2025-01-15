import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/widgets/card_widget.dart';
import 'package:manutencao_carros/config/widgets/textfield_widget.dart';
import 'package:manutencao_carros/domain/carros/veiculo_model.dart';

class VeiculoPesquisaItem extends StatelessWidget {
  final VeiculoModel veiculoModel;
  final Function onTap;
  const VeiculoPesquisaItem({
    required this.veiculoModel,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      onTap: onTap,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFieldWidget(
              label: "Nome",
              value: veiculoModel.nome,
            ),
            TextFieldWidget(
              label: "Placa",
              value: veiculoModel.placa,
            ),
          ],
        ),
        TextFieldWidget(
          label: "Kilometragem",
          value: "${veiculoModel.kilometragem} km",
        ),
      ],
    );
  }
}
