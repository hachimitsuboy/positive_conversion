
class CsvData {
  final String kanji;
  final String hiragana;
  final String pos;
  final double value;

//<editor-fold desc="Data Methods">

  const CsvData({
    required this.kanji,
    required this.hiragana,
    required this.pos,
    required this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CsvData &&
          runtimeType == other.runtimeType &&
          kanji == other.kanji &&
          hiragana == other.hiragana &&
          pos == other.pos &&
          value == other.value);

  @override
  int get hashCode =>
      kanji.hashCode ^ hiragana.hashCode ^ pos.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'CsvData{' +
        ' kanji: $kanji,' +
        ' hiragana: $hiragana,' +
        ' verb: $pos,' +
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
      pos: verb ?? this.pos,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kanji': this.kanji,
      'hiragana': this.hiragana,
      'verb': this.pos,
      'value': this.value,
    };
  }

  factory CsvData.fromMap(Map<String, dynamic> map) {
    return CsvData(
      kanji: map['kanji'] as String,
      hiragana: map['hiragana'] as String,
      pos: map['verb'] as String,
      value: map['value'] as double,
    );
  }

//</editor-fold>
}