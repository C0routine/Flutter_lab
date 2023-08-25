class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    // 1초마다 (ticks - count 를 계산한 값을) ticks 개수 까지만 Stream 을 만든다.
    return Stream.periodic(const Duration(seconds: 1), (count) => ticks - count - 1).take(ticks);
  }
}
