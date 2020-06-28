import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerentelojavirtual/widgets/order_header.dart';

class OrderTile extends StatelessWidget {
  final DocumentSnapshot order;

  OrderTile(this.order);

  final statusList = [
    '',
    'Em preparação',
    'Em transporte',
    'Aguardando entrega',
    'Entrega'
  ];

  @override
  Widget build(BuildContext context) {
    String orderCode = order.documentID
        .substring(order.documentID.length - 7, order.documentID.length);
    String status = statusList[order.data['status']];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          title: Text(
            '#$orderCode - $status',
            style: TextStyle(
              color:
                  order.data['status'] != 4 ? Colors.grey[850] : Colors.green,
            ),
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  OrderHeader(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: order.data['product'].map<Widget>((p) {
                      return ListTile(
                        title: Text('${p['product']['title']} ${p['size']}'),
                        subtitle: Text('${p['category']}/${p['pid']}'),
                        trailing: Text(
                          '${p['quantity']}',
                          style: TextStyle(fontSize: 20),
                        ),
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        textColor: Colors.red,
                        child: Text('Excluir'),
                      ),
                      FlatButton(
                        onPressed: () {},
                        textColor: Colors.grey[850],
                        child: Text('Regredir'),
                      ),
                      FlatButton(
                        onPressed: () {},
                        textColor: Colors.green,
                        child: Text('Avançar'),
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
