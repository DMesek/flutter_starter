// class LoggerObserver extends BlocObserver {
//   final FirebaseLogger _logger;

//   LoggerObserver(this._logger);

//   @override
//   void onError(Cubit cubit, Object error, StackTrace stackTrace) {
//     final String message =
//         'onError -- cubit: ${cubit.runtimeType}, error: $error';
//     _logger.log(message);
//     super.onError(cubit, error, stackTrace);
//   }
// }
