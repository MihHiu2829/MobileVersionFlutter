class Tick {
  Stream<int> tick({required int tick}) {
    return Stream.periodic(Duration(seconds: 1), (x) => tick - x - 1)
        .take(tick);  
  }
}
