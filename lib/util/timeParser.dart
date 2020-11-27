String timeAgoFromUTC(String time, {bool numericDates = true}) {
  final date2 = DateTime.now();
  final difference = date2.difference(DateTime.parse(time));

  String timeAgo;

  if ((difference.inDays / 365).floor() >= 2) {
    timeAgo = '${(difference.inDays / 365).floor()} years ago';
  } else if ((difference.inDays / 365).floor() >= 1) {
    timeAgo = (numericDates) ? '1 year ago' : 'Last year';
  } else if ((difference.inDays / 30).floor() >= 2) {
    timeAgo = '${(difference.inDays / 365).floor()} months ago';
  } else if ((difference.inDays / 30).floor() >= 1) {
    timeAgo = (numericDates) ? '1 month ago' : 'Last month';
  } else if ((difference.inDays / 7).floor() >= 2) {
    timeAgo = '${(difference.inDays / 7).floor()} weeks ago';
  } else if ((difference.inDays / 7).floor() >= 1) {
    timeAgo = (numericDates) ? '1 week ago' : 'Last week';
  } else if (difference.inDays >= 2) {
    timeAgo = '${difference.inDays} days ago';
  } else if (difference.inDays >= 1) {
    timeAgo = (numericDates) ? '1 day ago' : 'Yesterday';
  } else if (difference.inHours >= 2) {
    timeAgo = '${difference.inHours} hours ago';
  } else if (difference.inHours >= 1) {
    timeAgo = (numericDates) ? '1 hour ago' : 'An hour ago';
  } else if (difference.inMinutes >= 2) {
    timeAgo = '${difference.inMinutes} minutes ago';
  } else if (difference.inMinutes >= 1) {
    timeAgo = (numericDates) ? '1 minute ago' : 'A minute ago';
  } else if (difference.inSeconds >= 3) {
    timeAgo = '${difference.inSeconds} seconds ago';
  } else {
    timeAgo = 'Just now';
  }

  // String time = '${date.toLocal().hour}:${date.toLocal().minute}';
  return timeAgo;
}
