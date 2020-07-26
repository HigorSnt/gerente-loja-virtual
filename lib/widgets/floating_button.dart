import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gerentelojavirtual/blocs/orders_bloc.dart';
import 'package:gerentelojavirtual/widgets/edit_category_dialog.dart';

class FloatingButton extends StatelessWidget {
  FloatingButton(this.page);

  final int page;

  @override
  Widget build(BuildContext context) {
    final _orderBloc = BlocProvider.getBloc<OrdersBloc>();

    if (page == 1) {
      return SpeedDial(
        child: Icon(Icons.sort),
        backgroundColor: Colors.pinkAccent,
        overlayOpacity: 0.4,
        overlayColor: Colors.black,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.arrow_downward,
              color: Colors.pinkAccent,
            ),
            backgroundColor: Colors.white,
            label: 'Concluídos Abaixo',
            labelStyle: TextStyle(fontSize: 14),
            onTap: () {
              _orderBloc.setOrderCriteria(SortCriteria.READY_LAST);
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.arrow_upward,
              color: Colors.pinkAccent,
            ),
            backgroundColor: Colors.white,
            label: 'Concluídos Acima',
            labelStyle: TextStyle(fontSize: 14),
            onTap: () {
              _orderBloc.setOrderCriteria(SortCriteria.READY_FIRST);
            },
          ),
        ],
      );
    } else if (page == 2) {
      return FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => EditCategoryDialog(),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
