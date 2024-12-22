extension MapWithIndex on Iterable {
  Iterable<U> mapWithIndex<T, U>(U Function(T, int) f) {
    var index = 0;
    return map((e) => f(e, index++));
  }
}
