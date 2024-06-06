class CheckItem {
  // Attribute
  final String title;
  final DateTime timestamp;

  // Konstruktor
  const CheckItem({required this.title, required this.timestamp});

  // Methoden
  // ...
  @override
  String toString() => '$title|${timestamp.millisecondsSinceEpoch}';

  factory CheckItem.fromString(String item) {
    List<String> parts = item.split('|');
    return CheckItem(
      title: parts[0],
      timestamp: DateTime.fromMillisecondsSinceEpoch(int.parse(parts[1])),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CheckItem &&
        other.title == title &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode => title.hashCode ^ timestamp.hashCode;
}
