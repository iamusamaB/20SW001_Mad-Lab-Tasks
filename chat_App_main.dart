import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool _isGrid = false;

  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Viewer'),
        actions: [
          IconButton(
            icon: Icon(_isGrid ? Icons.list : Icons.grid_on),
            onPressed: () {
              setState(() {
                _isGrid = !_isGrid;
              });
            },
          ),
        ],
      ),
      body: _buildItems(),
    );
  }

  Widget _buildItems() {
    if (_isGrid) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_items[index]);
        },
      );
    } else {
      return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(_items[index]);
        },
      );
    }
  }

  Widget _buildItem(String item) {
    return Card(
      child: ListTile(
        title: Text(item),
      ),
    );
  }
}
