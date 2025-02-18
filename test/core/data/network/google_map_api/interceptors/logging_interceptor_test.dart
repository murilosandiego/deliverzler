import 'package:deliverzler/core/data/network/google_map_api/interceptors/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logging_interceptor_test.mocks.dart';

@GenerateMocks([
  ResponseInterceptorHandler,
  RequestInterceptorHandler,
  ErrorInterceptorHandler,
])
void main() {
  late MockResponseInterceptorHandler mockResponseInterceptorHandler;
  late MockRequestInterceptorHandler mockRequestInterceptorHandler;
  late MockErrorInterceptorHandler mockErrorInterceptorHandler;
  late LoggingInterceptor loggingInterceptor;

  setUp(() {
    mockResponseInterceptorHandler = MockResponseInterceptorHandler();
    mockRequestInterceptorHandler = MockRequestInterceptorHandler();
    mockErrorInterceptorHandler = MockErrorInterceptorHandler();
    loggingInterceptor = LoggingInterceptor();
  });

  group('onResponse', () {
    test(
      'should call handler.next',
      () async {
        // GIVEN
        final tResponse = Response(requestOptions: RequestOptions(path: ''));
        // WHEN
        loggingInterceptor.onResponse(
            tResponse, mockResponseInterceptorHandler);
        // THEN
        verify(mockResponseInterceptorHandler.next(tResponse)).called(1);
        verifyNoMoreInteractions(mockResponseInterceptorHandler);
      },
    );
  });

  group('onRequest', () {
    test(
      'should call handler.next',
      () async {
        // GIVEN
        final tOptions = RequestOptions(path: '');
        // WHEN
        loggingInterceptor.onRequest(tOptions, mockRequestInterceptorHandler);
        // THEN
        verify(mockRequestInterceptorHandler.next(tOptions)).called(1);
        verifyNoMoreInteractions(mockRequestInterceptorHandler);
      },
    );
  });

  group('onError', () {
    test(
      'should call handler.next',
      () async {
        // GIVEN
        final tError = DioError(requestOptions: RequestOptions(path: ''));
        // WHEN
        loggingInterceptor.onError(tError, mockErrorInterceptorHandler);
        // THEN
        verify(mockErrorInterceptorHandler.next(tError)).called(1);
        verifyNoMoreInteractions(mockErrorInterceptorHandler);
      },
    );
  });
}
