import 'package:flutter/material.dart';
import 'package:manutencao_carros/config/widgets/card_widget.dart';
import 'package:manutencao_carros/config/widgets/textfield_widget.dart';
import 'package:manutencao_carros/domain/veiculo/veiculo_model.dart';

class VeiculoManutencaoCard extends StatelessWidget {
  final VeiculoModel veiculoModel;
  const VeiculoManutencaoCard({
    super.key,
    required this.veiculoModel,
  });

  @override
  Widget build(BuildContext context) {
    /*if (veiculoModel.id != null || veiculoModel.id! > 0) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Nenhum veiculo encotrado!"),
        ),
      );
    }*/

    return CardWidget(
      children: [
        TextFieldWidget(
          label: "Veículo",
          value: veiculoModel.nome,
        ),
        TextFieldWidget(
          label: "Placa",
          value: veiculoModel.placa,
        ),
        TextFieldWidget(
          label: "Kilometragem",
          value: veiculoModel.kilometragem.toString(),
        ),
      ],
    );
  }
}
