enum DeviceScreenType {
  Mobile,
  Tablet,
  Desktop
}

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

enum SortUser{
  ByVerified,
  ByAlphabetically,
  ByNewest,
  ByOldest,
  ByMaxFollower
}

enum NotificationType{
  NOT_DETERMINED,
  Message,
  Reply,
  Retweet,
  Follow,
  Mention,
  Like
}