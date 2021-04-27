abstract class AnalyticsEvent {
  final String logEventName;
  final Map<String, dynamic> parameters;

  AnalyticsEvent({
    required this.logEventName,
    required this.parameters,
  });
}
