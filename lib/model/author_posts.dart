import 'package:lofo_app/model/record.dart';

List<Record> allRecordPosts = [];

Iterable<Record> getAuthorPosts(String customerName) {
  Iterable<Record> allAuthorPosts = allRecordPosts.where((element) {
    return element.customerName == customerName;
  });
  return allAuthorPosts;
}
