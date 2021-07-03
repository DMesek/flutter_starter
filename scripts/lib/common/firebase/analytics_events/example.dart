import 'analytics_event.dart';

class CommentLikeLog extends AnalyticsEvent {
  final String id;

  CommentLikeLog({
    required this.id,
  }) : super(logEventName: 'comment_like', parameters: {
          'comment_id': id,
        });
}
