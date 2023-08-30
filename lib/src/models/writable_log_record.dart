import 'package:logging/logging.dart';

/// Db-related extension for Level
extension WritableLevel on Level {
  /// Return Level by value
  static Level fromValue(int value) {
    return Level.LEVELS.firstWhere((element) => element.value == value);
  }
}

/// Db-related extension for LogRecord
extension WritableLogRecord on LogRecord {
  /// Prepare structure for writing to db
  Map<String, dynamic> toMap({required int sessionId}) {
    return {
      'session_id': sessionId,
      'level': level.value,
      'message': message,
      'logger_name': loggerName,
      'error': error?.toString(),
      'stack_trace': stackTrace.toString(),
      'time': time.microsecondsSinceEpoch,
    };
  }

  /// Create LogRecord from db record
  static LogRecord fromMap(Map<String, dynamic> map) {
    return LogRecord(
      WritableLevel.fromValue(map['level'] as int),
      map['message'] as String,
      map['logger_name'] as String,
      map['error'] as String,
      StackTrace.fromString(map['stack_trace'] as String),
    );
  }
}
