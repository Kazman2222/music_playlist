class ArtisteDetails {
  String artistName;
  String artistCount;
  String artistAbout;
  String? artistAbout2;
  String artistImage;
  String artistFollowers;
  String artistRealName;
  bool artistVerified;
  String? instagramHandle;
  String? snapHandle;
  String? youtubeHandle;
  String? facebookHandle;

  ArtisteDetails(
      {required this.artistCount,
      required this.artistName,
      required this.artistAbout,
      required this.artistImage,
      required this.artistFollowers,
      required this.artistRealName,
      this.artistAbout2,
      required this.artistVerified,
      this.facebookHandle,
      this.instagramHandle,
      this.snapHandle,
      this.youtubeHandle});
}
