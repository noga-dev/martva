extension IntersperseExtension<T> on Iterable<T> {
  Iterable<T> intersperse(T separator) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current; // Yield the first element
      while (iterator.moveNext()) {
        yield separator; // Yield the separator
        yield iterator.current; // Yield the next element
      }
    }
  }
}
