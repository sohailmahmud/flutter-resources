import 'dart:developer';
import 'package:async/async.dart';
import 'package:http/http.dart';

Future<String> fetchDataFromApi() async {
  final response = await get(Uri.parse('https://catfact.ninja/fact'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load data from API');
  }
}

void main() async {
  // Create an AsyncMemoizer to cache the result of fetchDataFromApi
  final memoizer = AsyncMemoizer<String>();

  // Create a stopwatch to measure time
  final stopwatch = Stopwatch()..start();

  // Call the memoizer to fetch data
  String data1 = await memoizer.runOnce(fetchDataFromApi);
  log('data1: $data1',
      name: 'memoizer'); // Output: Data from API (takes 2 seconds)

  final firstCallTime = stopwatch.elapsed;

  log("First call: $data1 (took ${firstCallTime.inMilliseconds}ms)",
      name: 'memoizer');

  // Reset the stopwatch for the second call
  stopwatch.reset();

  // Call the memoizer again, but it will use the cached result
  String data2 = await memoizer.runOnce(fetchDataFromApi);
  log('data2: $data2',
      name: 'memoizer'); // Output: Data from API (almost instantaneous)

  final secondCallTime = stopwatch.elapsed;

  log("Second call: $data2 (took ${secondCallTime.inMilliseconds}ms)",
      name: 'memoizer');

  // Check if the data is the same
  log('data1 == data2: ${data1 == data2}', name: 'memoizer'); // Output: true
}
