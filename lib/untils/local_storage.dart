import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  void addData(String data) async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? newData = sharedPreferences.getStringList('input_data');
    newData?.add(data);
    sharedPreferences.setStringList('input_data', newData ?? [data]);
  }

  Future<List<String>> getData() async {
    // SharedPreferences.setMockInitialValues({});
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? newData = sharedPreferences.getStringList('input_data');
    return newData ?? [];
  }
}
