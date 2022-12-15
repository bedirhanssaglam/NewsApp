enum RouteEnums {
  splash('/splash'),
  home('/home'),
  details('/details/:description/:imageUrl');

  final String routeName;
  const RouteEnums(this.routeName);
}
