import 'package:cyney/src/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens a web url in the device's default browser
Future<void> launchUrl(String url) async {
  final bool canLaunchUrl = await canLaunch(url);
  if (canLaunchUrl) {
    final bool successful = await launch(url);
    if (!successful) {
      return Future<void>.error('Failed to launch $url');
    }
  } else {
    return Future<void>.error('Could not launch $url');
  }
}

/// Opens the device's email app with the given optionally a subject and body
Future<void> launchEmail({String subject, String body}) async {
  String sub = subject ?? '';
  String content = body ?? '';

  final uri = Uri(
    scheme: 'mailto',
    path: EMAIL_APP,
    query: 'subject=$sub&body=$content',
  );

  String url = uri.toString();

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}
