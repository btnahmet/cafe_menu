import 'package:flutter/material.dart';

class TableSelectionScreen extends StatelessWidget {
  const TableSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 700 ? 8 : width > 500 ? 6 : 4;
    final buttonHeight = width > 700 ? 80.0 : 60.0;
    final buttonFontSize = width > 700 ? 20.0 : 16.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masa Seç'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2,
          ),
          itemCount: 50,
          itemBuilder: (context, index) {
            final tableNumber = index + 1;
            return SizedBox(
              height: buttonHeight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade200,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  Navigator.pop(context, 'Masa $tableNumber');
                },
                child: Center(
                  child: Text(
                    'Masa $tableNumber',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: buttonFontSize,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 