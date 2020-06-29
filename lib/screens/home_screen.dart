import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gerentelojavirtual/blocs/orders_bloc.dart';
import 'package:gerentelojavirtual/blocs/user_bloc.dart';
import 'package:gerentelojavirtual/tabs/orders_tab.dart';
import 'package:gerentelojavirtual/tabs/products_tab.dart';
import 'package:gerentelojavirtual/tabs/users_tab.dart';
import 'package:gerentelojavirtual/widgets/edit_category_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.pinkAccent,
          primaryColor: Colors.white,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(
                  color: Colors.white,
                ),
              ),
        ),
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: (p) {
            _pageController.animateToPage(
              p,
              duration: Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Clientes'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Pedidos'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Produtos'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: BlocProvider(
          blocs: [
            Bloc((i) => UserBloc()),
            Bloc((i) => OrdersBloc()),
          ],
          child: PageView(
            controller: _pageController,
            onPageChanged: (p) {
              setState(() {
                _page = p;
              });
            },
            children: <Widget>[
              UsersTab(),
              OrdersTab(),
              ProductsTab(),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloating(),
    );
  }

  Widget _buildFloating() {
    final _orderBloc = BlocProvider.getBloc<OrdersBloc>();

    if (_page == 1) {
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
    } else if (_page == 2) {
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
      return null;
    }
  }
}
