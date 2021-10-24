
class CsvData {
  final String kanji;
  final String hiragana;
  final String verb;
  final double value;

//<editor-fold desc="Data Methods">

  const CsvData({
    required this.kanji,
    required this.hiragana,
    required this.verb,
    required this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CsvData &&
          runtimeType == other.runtimeType &&
          kanji == other.kanji &&
          hiragana == other.hiragana &&
          verb == other.verb &&
          value == other.value);

  @override
  int get hashCode =>
      kanji.hashCode ^ hiragana.hashCode ^ verb.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'CsvData{' +
        ' kanji: $kanji,' +
        ' hiragana: $hiragana,' +
        ' verb: $verb,' +
        ' value: $value,' +
        '}';
  }

  CsvData copyWith({
    String? kanji,
    String? hiragana,
    String? verb,
    double? value,
  }) {
    return CsvData(
      kanji: kanji ?? this.kanji,
      hiragana: hiragana ?? this.hiragana,
      verb: verb ?? this.verb,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kanji': this.kanji,
      'hiragana': this.hiragana,
      'verb': this.verb,
      'value': this.value,
    };
  }

  factory CsvData.fromMap(Map<String, dynamic> map) {
    return CsvData(
      kanji: map['kanji'] as String,
      hiragana: map['hiragana'] as String,
      verb: map['verb'] as String,
      value: map['value'] as double,
    );
  }

//</editor-fold>
}