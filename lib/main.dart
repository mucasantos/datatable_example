import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nomeController = TextEditingController();

  TextEditingController idadeController = TextEditingController();

  TextEditingController funcaoController = TextEditingController();

  List<DataRow> dadosTabela = [
    const DataRow(
      cells: <DataCell>[
        DataCell(Text('Janine')),
        DataCell(Text('43')),
        DataCell(Text('Professor')),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste Table",
      home: Scaffold(
        appBar: AppBar(title: const Text("Teste Table")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: nomeController,
              ),
              TextField(
                controller: idadeController,
              ),
              TextField(
                controller: funcaoController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dadosTabela.add(
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text(nomeController.text)),
                                DataCell(Text(idadeController.text)),
                                DataCell(Text(funcaoController.text)),
                              ],
                            ),
                          );
                        });
                      },
                      child: const Text('Salvar')),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          dadosTabela.clear();
                        });
                      },
                      child: const Text('Apagar')),
                ],
              ),
              DataTable(columns: const <DataColumn>[
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Idade',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Função',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ], rows: dadosTabela)
            ],
          ),
        ),
      ),
    );
  }
}
