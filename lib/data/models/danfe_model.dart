import '../../domain/entities/danfe_entity.dart';

class DanfeModel extends Danfe {
  DanfeModel({
    required String dataEmissao,
    required String numero,
    required String serie,
    required String cnpj,
    required String chave,
    required String modelo,
    required String uf,
    required String codigo,
    required String digito,
  }) : super(
          dataEmissao: dataEmissao,
          numero: numero,
          serie: serie,
          cnpj: cnpj,
          chave: chave,
          modelo: modelo,
          uf: uf,
          codigo: codigo,
          digito: digito,
        );

  factory DanfeModel.fromJson(Map<String, dynamic> json) {
    return DanfeModel(
      dataEmissao: json['data_emissao'],
      numero: json['numero'],
      serie: json['serie'],
      cnpj: json['cnpj'],
      chave: json['chave']['chavenf'],
      modelo: json['modelo'],
      uf: json['uf'],
      codigo: json['codigo'],
      digito: json['digito'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data_emissao': dataEmissao,
      'numero': numero,
      'serie': serie,
      'cnpj': cnpj,
      'chave': chave,
      'modelo': modelo,
      'uf': uf,
      'codigo': codigo,
      'digito': digito,
    };
  }
}
