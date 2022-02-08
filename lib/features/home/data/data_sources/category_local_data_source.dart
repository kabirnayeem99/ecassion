import 'package:ecassion/core/utility.dart';
import 'package:ecassion/features/home/data/dto/category_dto.dart';
import 'package:faker/faker.dart';

class CategoryLocalDataSource {
  Future<List<CategoryDto>> getCategoryList() async {
    await Future.delayed(loadRandomDuration());
    return <CategoryDto>[

      CategoryDto(
          id: faker.guid.guid(),
          name: faker.lorem.word(),
          imageUrl:
              "https://media.istockphoto.com/vectors/seamless-pattern-social-concept-of-people-communication-in-flat-style-vector-id624126636?k=6&m=624126636&s=170667a&w=0&h=ccy_FszqtAODsAimm3Lv6YpTAFLGYREiWqd8hcMUEO8="),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl: RANDOM_IMAGE_URL[random.integer(RANDOM_IMAGE_URL.length)],
      ),
      CategoryDto(
          id: faker.guid.guid(),
          name: faker.lorem.word(),
          imageUrl:
          "https://arlingtonva.s3.dualstack.us-east-1.amazonaws.com/wp-content/uploads/sites/17/2014/02/badminton-1.jpg"),
      CategoryDto(
        id: faker.guid.guid(),
        name: faker.lorem.word(),
        imageUrl:
        "https://www.cdc.gov/heartdisease/images/hd-family-history.jpg",
      ),
    ];
  }
}

const RANDOM_IMAGE_URL = [
  "http://www.speakerboxmind.com/wp-content/uploads/2014/12/Four-Sporting-Experiences-to-Incorporate-into-Your-Holiday.jpg",
  "https://assets.visitphilly.com/wp-content/uploads/2018/02/UnionvGalaxy13_1814-2-1200-2200x1237.jpg",
  "http://www.experiencify.com/wp-content/uploads/2015/12/sports-fans.jpg",
  "https://www.gannett-cdn.com/presto/2019/02/26/USAT/63112646-ddb1-4587-a587-546485e9299e-C03_National_Anthem.JPG?crop=4895,2753,x1,y270&width=3200&height=1680&fit=bounds",
  "https://traveler.marriott.com/wp-content/uploads/2018/01/GI_867787028_CommonwealthGames.jpg",
  "http://dailycaring.com/wp-content/uploads/2016/11/Alz-wandering1200x630.jpg",
  "https://blog.headbox.com/wp-content/uploads/2018/09/detail_twobytwo_NHM_080917-3.jpg"
];
