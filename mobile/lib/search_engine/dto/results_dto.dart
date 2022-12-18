import 'item_dto.dart';

class ResultsDto{
  List<ItemDto> results;

  ResultsDto({
    required this.results,
  });

  factory ResultsDto.fromJson(Map<String, dynamic> json) {
    return ResultsDto(
      results: (json['results'] as List)
          .map((e) => ItemDto.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'results': results.map((e) => e.toJson()).toList(),
  };

}