import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class LanguageEvent {
  final String language;
  LanguageEvent(this.language);
}
