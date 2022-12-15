enum RouteEnums {
  splash('/splash'),
  home('/home'),
  sources('/sources'),
  details('/details/:description/:imageUrl');

  final String routeName;
  const RouteEnums(this.routeName);
}
