enum RouteEnums {
  splash('/splash'),
  home('/home'),
  sources('/sources'),
  sourcesNews('/sources-news'),
  searchedNews('/searched-news/:searchWord'),
  details('/details/:description/:imageUrl/:sourceName/:author');

  final String routeName;
  const RouteEnums(this.routeName);
}
