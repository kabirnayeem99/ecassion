import 'package:ecassion/features/home/data/dto/category_dto.dart';
import 'package:faker/faker.dart';

class CategoryLocalDataSource {
  Future<List<CategoryDto>> getCategoryList() async {
    return <CategoryDto>[
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.sport.name(),
        imageUrl: loadRandomImageUrl(),
      ),
    ];
  }
}

String loadRandomImageUrl() =>
    randomImageUrl[random.integer(randomImageUrl.length)];

const randomImageUrl = [
  "https://i.pinimg.com/originals/1c/ee/3e/1cee3e0016de040c4669e60cdce1467f.jpg"
];
