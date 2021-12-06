class DataService {
  int increment = 0;
  Future<int> getValue() async {
    int result = await Future.delayed(Duration(seconds: 5), () => 4);
    return result;
  }

  Stream<int> getStream() async* {
    while (true) {
      int result =
          await Future.delayed(Duration(milliseconds: 500), () => ++increment);

      yield result;
    }
  }
}
