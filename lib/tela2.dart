import 'package:flutter/material.dart';

class TelaNova extends StatelessWidget {
  final List<DataRow>? dadosTabela;

  const TelaNova({
    super.key,
    required this.dadosTabela,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Segunda tela")),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            ], rows: dadosTabela!)
          ],
        ),
      ),
    );
  }
}
