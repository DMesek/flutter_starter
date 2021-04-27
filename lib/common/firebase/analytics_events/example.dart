import 'analytics_event.dart';

class CommentLikeLog extends AnalyticsEvent {
  static const eventName = 'comment_like';
  static const commentId = 'comment_id';

  final String id;

  CommentLikeLog({
    required this.id,
  }) : super(logEventName: eventName, parameters: {
          commentId: id,
        });
}
