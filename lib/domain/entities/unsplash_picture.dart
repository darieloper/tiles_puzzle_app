class UnsplashPicture {
  final String id;
  final String? description;
  final String? altDescription;
  final int likes;
  final UrlsData? urls;
  final LinksData? links;

  UnsplashPicture({
    required this.id,
    this.description,
    this.altDescription,
    required this.likes,
    required this.urls,
    required this.links,
  });

  factory UnsplashPicture.fromJson(Map<String, dynamic> json) {
    final urls = json['urls'] as Map<String, dynamic>;
    final links = json['links'] as Map<String, dynamic>;

    return UnsplashPicture(
      id: json['id'],
      likes: json['likes'],
      urls: UrlsData.fromJson(urls),
      links: LinksData.fromJson(links),
    );
  }

  @override
  String toString() {
    return '{ id: "$id", likes: $likes, urls: $urls, links: $links }';
  }
}

class UrlsData {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;

  UrlsData({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });

  factory UrlsData.fromJson(Map<String, dynamic> json) {
    return UrlsData(
      raw: json['raw'],
      full: json['full'],
      regular: json['regular'],
      small: json['small'],
      thumb: json['thumb'],
    );
  }

  @override
  String toString() {
    return '''
    { raw: "$raw", full: "$full", regular: "$regular", small: "$small", thumb: "$thumb" }
    ''';
  }
}

class LinksData {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  LinksData({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory LinksData.fromJson(Map<String, dynamic> json) {
    return LinksData(
      self: json['self'],
      html: json['html'],
      download: json['download'],
      downloadLocation: json['download_location'],
    );
  }

  @override
  String toString() {
    return '''
    { self: "$self", html: "$html", download: "$download", download_location: "$downloadLocation" }
    ''';
  }
}

class SearchResults {
  final int total;
  final int totalPages;
  final List<UnsplashPicture> results;

  SearchResults({
    required this.total,
    required this.totalPages,
    required this.results,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) {
    final photos = json['photos'] as Map<String, dynamic>;
    final results = photos['results'] as List<dynamic>;

    return SearchResults(
      total: photos['total'],
      totalPages: photos['total_pages'],
      results:
          results.map((element) => UnsplashPicture.fromJson(element)).toList(),
    );
  }
}
