import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../../domain/usecases/get_dnfe_data.dart';
import '../../domain/entities/danfe_entity.dart';

class DanfePage extends StatefulWidget {
  const DanfePage({Key? key}) : super(key: key);

  @override
  _DanfePageState createState() => _DanfePageState();
}

class _DanfePageState extends State<DanfePage> {
  final _danfeController = TextEditingController();
  bool _isLoading = false;
  Danfe? danfeData;

  @override
  void dispose() {
    _danfeController.dispose();
    super.dispose();
  }

  Future<void> _fetchData() async {
    final getDanfeData = GetIt.instance<GetDanfeData>();
    final danfe = await getDanfeData.execute(_danfeController.text);
    setState(() {
      danfeData = danfe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Color(0xffff7f00),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MINDTECH',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Home    Sobre nós    Soluções    Preços    Contato',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Tem um jeito melhor de fazer negócios.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Extração de dados de DANFE em tempo real para manter seu négocio fluindo.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 600,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Teste nossa ferramenta, insira uma chave danfe e veja a magica acontecer.',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _danfeController,
                          decoration: InputDecoration(
                            labelText: 'Chave DANFE',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _fetchData,
                          child: Text('Extrair'),
                        ),
                        SizedBox(height: 20),
                        if (_isLoading)
                          CircularProgressIndicator()
                        else if (danfeData != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Data de Emissão: ${danfeData!.dataEmissao}'),
                              Text('Número: ${danfeData!.numero}'),
                              Text('Série: ${danfeData!.serie}'),
                              Text('CNPJ: ${danfeData!.cnpj}'),
                              Text('Chave: ${danfeData!.chave}'),
                              Text('Modelo: ${danfeData!.modelo}'),
                              Text('UF: ${danfeData!.uf}'),
                              Text('Código: ${danfeData!.codigo}'),
                              Text('Dígito: ${danfeData!.digito}'),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Color(0xFFF8F8F8),
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Text(
                    'Nossa História',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.location_city),
                          Text('Offices\nGurgaon, Chennai, Toronto, New York'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.people),
                          Text('50+ Employees'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.attach_money),
                          Text('\$7 Billion Loan underwritten'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.rocket),
                          Text(
                              'Founded in 2017 - Introduced auto underwriting'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
