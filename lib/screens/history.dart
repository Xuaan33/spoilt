import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class History extends StatefulWidget {
  final Map<String, dynamic>? userData;
  const History({Key? key, this.userData}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> predictions = [];
  List<Reference> storageItems = [];

  @override
  void initState() {
    super.initState();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    final ListResult result =
        await FirebaseStorage.instance.ref('History').listAll();
    final items = result.items;

    predictions.clear(); // Clear the predictions list before fetching new data
    storageItems.clear(); // Clear the storageItems list

    for (final item in items) {
      final String timestamp = item.name.split('.').first;
      final String extension = item.name.split('.').last;

      if (extension == 'txt') {
        final textData = await item.getData();
        if (textData != null) {
          final prediction = utf8.decode(textData);
          // Check if the prediction already exists in predictions
          final existingPredictionIndex =
              predictions.indexWhere((data) => data['timestamp'] == timestamp);
          if (existingPredictionIndex != -1) {
            // Update the existing prediction
            predictions[existingPredictionIndex]['prediction'] =
                _extractPrediction(prediction);
            // Extract the topic from the prediction text
            final topicIndex = prediction.indexOf(':');
            if (topicIndex != -1) {
              final topic = prediction.substring(topicIndex + 1).trim();
              predictions[existingPredictionIndex]['topic'] = topic;
            }
          } else {
            // Add a new prediction
            predictions.add({
              'timestamp': timestamp,
              'imageUrl': '',
              'prediction': _extractPrediction(prediction),
              'topic': _extractTopic(prediction),
            });
          }
          // Add the item to the storageItems list
          storageItems.add(item);
        }
      }
    }
    setState(() {});
  }

  Future<void> deleteItem(int index) async {
    // Remove the item from Firebase Storage
    final item = storageItems[index];
    await item.delete();
    // Remove the item from the predictions list
    setState(() {
      predictions.removeAt(index);
    });
  }

  String _extractTopic(String predictionText) {
    final lines = predictionText.split('\n');
    final topicLine = lines.firstWhere(
      (line) => line.startsWith('Spotted:'),
      orElse: () => '',
    );
    return topicLine.isNotEmpty ? topicLine.split(':').last.trim() : '';
  }

  String _extractPrediction(String predictionText) {
    final lines = predictionText.split('\n');
    final predictionLine = lines.firstWhere(
      (line) => line.startsWith('Prediction:'),
      orElse: () => '',
    );
    return predictionLine.isNotEmpty
        ? predictionLine.split(':').last.trim()
        : '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('History',
            style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600)),
      ),
      body: RefreshIndicator(
        onRefresh: () => fetchHistory(),
        child: ListView.builder(
          itemCount: predictions.length,
          itemBuilder: (context, index) {
            final data = predictions.reversed.toList()[index];

            return Dismissible(
              key: Key(data['timestamp']), // Use a unique key for each item
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                // Delete the item from Firebase Storage and update the UI
                deleteItem(index);
                // Show a snackbar to undo the deletion
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item deleted'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // TODO: Implement undo deletion
                      },
                    ),
                  ),
                );
              },

              background: Container(
                color: Colors.red,
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Icon(Icons.delete, color: Colors.white),
              ),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        data['prediction'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 8),
                            Text('Timestamp: ${data['timestamp']}'),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('fresh'))
                              Image.asset(
                                  'assets/${data['prediction'].toString().toLowerCase().replaceAll(' ', '')}.png'),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('rotten'))
                              Image.asset(
                                  'assets/${data['prediction'].toString().toLowerCase().replaceAll(' ', '')}.png'),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('fresh'))
                              const Text(
                                'You are safe to consume!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('rotten'))
                              const Text(
                                'Please do not consume!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('apples'))
                              const Text(
                                  "Calories: 95\nCarbohydrates: 25 g\nFiber: 4 g\nSugars: 19 g\nProtein: 0 g\nFat: 0 g\nVitamin C: 14% of the Daily Value (DV)\nPotassium: 6% of the DV\nVitamin K: 5% of the DV"),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('banana'))
                              const Text(
                                  "Calories: 105\nProtein: 1.3 g\nFat: 0.4 g\nCarbohydrates: 27 g\nDietary fiber: 3.1 g\nSugars: 14.4 g\nVitamins and minerals:\nVitamin C: 10.3 mg (about 14% of the Daily Value (DV))\nVitamin B6: 0.4 mg (about 22% of the DV)\nFolate: 24.4 mcg (about 6% of the DV)\nPotassium: 422 mg (about 9% of the DV)\nMagnesium: 32.3 mg (about 8% of the DV)\nManganese: 0.3 mg (about 16% of the DV)"),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('carrot'))
                              const Text(
                                  "Calories: 25\nProtein: 0.6 g\nFat: 0.1 g\nCarbohydrates: 6 g\nFiber: 1.7 g\nSugars: 3 g\nVitamin A: 184% of the Daily Value (DV)\nVitamin K: 13% of the DV\nVitamin C: 7% of the DV\nPotassium: 7% of the DV\nVitamin B6: 6% of the DV\nBeta-carotene: 18429 micrograms"),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('oranges'))
                              const Text(
                                  "Calories: 62\nProtein: 1.2 g\nCarbohydrates: 15.4 g\nDietary fiber: 3.1 g\nSugars: 12.2 g\nFat: 0.2 g\nVitamin C: 69.7 mg (116% DV)\nVitamin A: 295 IU (6% DV)\nFolate: 39.1 mcg (10% DV)\nPotassium: 237 mg (7% DV)\nCalcium: 52.4 mg (5% DV)\nMagnesium: 13.1 mg (3% DV)\nVitamin B6: 0.1 mg (3% DV)"),
                            if (data['prediction']
                                .toString()
                                .toLowerCase()
                                .contains('tomato'))
                              const Text(
                                  "Calories: 22\nProtein: 1.1 g\nCarbohydrates: 4.8 g\nDietary fiber: 1.5 g\nSugars: 3.2 g\nFat: 0.2 g\nVitamin C: 15.6 mg (26% of the Daily Value)\nVitamin A: 1025 IU (21% of the Daily Value)\nPotassium: 292 mg (8% of the Daily Value)\nVitamin K: 9.7 mcg (12% of the Daily Value)\nFolate: 27.1 mcg (7% of the Daily Value)"),
                            Text(
                              _extractPrediction(data['prediction'] ?? ''),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    title: Text(
                      'Spotted: ${data['prediction'] ?? ''}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      'Tap to expand',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                      ),
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
