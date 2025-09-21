import 'dart:developer' as dev;


void logInfo(String message) => dev.log(message, name: 'INFO');
void logError(String message, [Object? e, StackTrace? s]) => dev.log(
message,
name: 'ERROR',
error: e,
stackTrace: s,
);