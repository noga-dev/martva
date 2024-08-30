extension ISO8601Extension on String {
  DateTime toISO8601DateTime() => DateTime.parse(this);
}
