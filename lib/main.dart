import 'package:datatable_example/tela2.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        home: MyApp(),
        title: "TEste Tabela",
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController nomeController = TextEditingController();

  TextEditingController idadeController = TextEditingController();

  TextEditingController funcaoController = TextEditingController();

  List<DataRow> dadosTabela = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Test Table")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Digite o seu nome", labelText: "Nome"),
              controller: nomeController,
            ),
            TextField(
              decoration:
                  InputDecoration(hintText: "Sua idade", labelText: "Idade"),
              controller: idadeController,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Digite a sua função", labelText: "Função"),
              controller: funcaoController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('Salvar')),
                ElevatedButton(onPressed: () {}, child: const Text('Apagar')),
                ElevatedButton(
                  child: const Text('Open route'),
                  onPressed: () {
                    dadosTabela.add(
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text(nomeController.text)),
                          DataCell(Text(idadeController.text)),
                          DataCell(Text(funcaoController.text)),
                        ],
                      ),
                    );
                    nomeController.text = "";
                    idadeController.text = "";
                    funcaoController.text = "";

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TelaNova(
                                dadosTabela: dadosTabela,
                              )),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
