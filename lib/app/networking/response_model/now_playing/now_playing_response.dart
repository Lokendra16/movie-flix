import 'package:json_annotation/json_annotation.dart';

part 'now_playing_response.g.dart';

@JsonSerializable()
class NowPlayingResponse {
  NowPlayingResponse(
      {this.dates,
      this.page,
      this.results,
      this.total_results,
      this.total_pages});

  Dates? dates;
  int? page;
  List<Results>? results;
  int? total_pages;
  int? total_results;

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingResponseToJson(this);
}

@JsonSerializable()
class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  String? maximum;
  String? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);

  Map<String, dynamic> toJson() => _$DatesToJson(this);
}

@JsonSerializable()
class Results {
  Results(
      {this.adult,
      this.backdrop_path,
      this.id,
      this.genre_ids,
      this.original_language,
      this.original_title,
      this.vote_average,
      this.vote_count,
      this.poster_path,
      this.overview,
      this.popularity,
      this.title,
      this.release_date,
      this.video});

  bool? adult;
  String? backdrop_path;
  List<int>? genre_ids;
  int? id;
  String? original_language;
  String? original_title;
  String? overview;
  double? popularity;
  String? poster_path;
  String? release_date;
  String? title;
  bool? video;
  double? vote_average;
  int? vote_count;

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
