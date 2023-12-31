// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingResponse _$NowPlayingResponseFromJson(Map<String, dynamic> json) =>
    NowPlayingResponse(
      dates: json['dates'] == null
          ? null
          : Dates.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_results: json['total_results'] as int?,
      total_pages: json['total_pages'] as int?,
    );

Map<String, dynamic> _$NowPlayingResponseToJson(NowPlayingResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };

Dates _$DatesFromJson(Map<String, dynamic> json) => Dates(
      maximum: json['maximum'] as String?,
      minimum: json['minimum'] as String?,
    );

Map<String, dynamic> _$DatesToJson(Dates instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      adult: json['adult'] as bool?,
      backdrop_path: json['backdrop_path'] as String?,
      id: json['id'] as int?,
      genre_ids:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      original_language: json['original_language'] as String?,
      original_title: json['original_title'] as String?,
      vote_average: (json['vote_average'] as num?)?.toDouble(),
      vote_count: json['vote_count'] as int?,
      poster_path: json['poster_path'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      title: json['title'] as String?,
      release_date: json['release_date'] as String?,
      video: json['video'] as bool?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdrop_path,
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'original_language': instance.original_language,
      'original_title': instance.original_title,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.poster_path,
      'release_date': instance.release_date,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.vote_average,
      'vote_count': instance.vote_count,
    };
