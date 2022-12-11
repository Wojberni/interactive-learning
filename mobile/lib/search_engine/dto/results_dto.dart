import 'item_dto.dart';

class ResultsDto{
  final List<ItemDto> results;

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
}