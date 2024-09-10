class AirtableResponse {
  AirtableResponse({required this.records});

  factory AirtableResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      AirtableResponse(
        records: (json['records'] as List)
            .map(
              (item) => AirtableRecord.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );

  final List<AirtableRecord> records;
}

class AirtableRecord {
  AirtableRecord({
    required this.id,
    required this.createdTime,
    required this.fields,
  });

  factory AirtableRecord.fromJson(
    Map<String, dynamic> json,
  ) =>
      AirtableRecord(
        id: json['id'] as String,
        createdTime: DateTime.parse(json['createdTime'] as String),
        fields: AirtableFields.fromJson(json['fields'] as Map<String, dynamic>),
      );

  final String id;
  final DateTime createdTime;
  final AirtableFields fields;
}

class AirtableFields {
  AirtableFields({required this.name, required this.count});

  factory AirtableFields.fromJson(
    Map<String, dynamic> json,
  ) =>
      AirtableFields(
        name: json['name'] as String,
        count: json['count'] as int,
      );

  final String name;
  final int count;
}
