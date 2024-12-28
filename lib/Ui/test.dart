import 'package:flutter/material.dart';

class IngredientsInputPage extends StatefulWidget {
  @override
  _IngredientsInputPageState createState() => _IngredientsInputPageState();
}

class _IngredientsInputPageState extends State<IngredientsInputPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _ingredients = [];

  void _addIngredient() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _ingredients.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Type an ingredient',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addIngredient,
                ),
              ),
              onFieldSubmitted: (value) => _addIngredient(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _ingredients.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      child: ListTile(
                        title: Text(_ingredients[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _ingredients.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


