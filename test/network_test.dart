import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shelf/data/network.dart';
import 'package:shelf/model/author.dart';

///Create a mock class for [NetworkService].
class MockNetworkService extends Mock implements NetworkService {}

void main() {
  late MockNetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
  });

  test('Test that we get the desired response when we call the api', () async {
    //Arrange
    final expectedResponse = [
      Author(
        id: '1',
        name: 'John Doe',
        description:
            'John Doe is a fictional character created by the author of the book "The Hobbit".',
        link: 'https://quotable.io/author/john-doe',
        slug: 'john-doe',
        dateAdded: '2020-01-01',
        dateModified: '2020-01-01',
        quoteCount: 2,
        bio:
            'John Doe is a fictional character created by the author of the book "The Hobbit".',
      ),
    ];

    //Act
    when(() => mockNetworkService.getAuthorData(any()))
        .thenAnswer((_) async => expectedResponse);

    //Assert
    expect(mockNetworkService.getAuthorData(1), completion(expectedResponse));
  });
}
