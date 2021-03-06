import 'package:kiwi/kiwi.dart';

import '../../data/data_sources/category_local_data_source.dart';
import '../../data/data_sources/event_local_data_source.dart';
import '../../data/data_sources/recommendation_local_data_source.dart';
import '../../data/data_sources/search_local_data_source.dart';
import '../../data/repositories/category_repository_impl.dart';
import '../../data/repositories/event_repository_impl.dart';
import '../../data/repositories/recommendation_repository_impl.dart';
import '../../data/repositories/search_repository_impl.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/event_repository.dart';
import '../../domain/repositories/recommendation_repository.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/use_cases/get_categories.dart';
import '../../domain/use_cases/get_event_details.dart';
import '../../domain/use_cases/get_interests.dart';
import '../../domain/use_cases/get_nearby_events.dart';
import '../../domain/use_cases/get_popular_cities.dart';
import '../../domain/use_cases/get_trending_event.dart';
import '../../domain/use_cases/get_upcoming_event.dart';
import '../../domain/use_cases/search_event_by_city.dart';
import '../../domain/use_cases/search_event_by_interest.dart';
import '../../domain/use_cases/search_event_by_query.dart';

KiwiContainer di = KiwiContainer();

Future<void> setUpInjector() async {
  setUpDataSourceInjector();
  setUpRepositoryInjector();
  setUpUseCasesInjector();
}

void setUpDataSourceInjector() {
  di.registerSingleton((container) => CategoryLocalDataSource());
  di.registerSingleton((container) => EventLocalDataSource());
  di.registerSingleton((container) => RecommendationDataSource());
  di.registerSingleton((container) => SearchLocalDataSource());
}

void setUpRepositoryInjector() {
  di.registerFactory<CategoryRepository>((container) =>
      CategoryRepositoryImpl(container.resolve<CategoryLocalDataSource>()));
  di.registerFactory<EventRepository>((container) =>
      EventRepositoryImpl(container.resolve<EventLocalDataSource>()));
  di.registerFactory<RecommendationRepository>((container) =>
      RecommendationRepositoryImpl(
          container.resolve<RecommendationDataSource>()));
  di.registerFactory<SearchRepository>((container) =>
      SearchRepositoryImpl(container.resolve<SearchLocalDataSource>()));
}

void setUpUseCasesInjector() {
  di.registerFactory((container) => GetCategories(container.resolve()));
  di.registerFactory((container) => GetEventDetails(container.resolve()));
  di.registerFactory((container) => GetInterests(container.resolve()));
  di.registerFactory((container) => GetPopularCities(container.resolve()));
  di.registerFactory((container) => GetTrendingEvent(container.resolve()));
  di.registerFactory((container) => GetNearbyEvents(container.resolve()));
  di.registerFactory((container) => GetUpcomingEvent(container.resolve()));
  di.registerFactory((container) => SearchEventByCity(container.resolve()));
  di.registerFactory((container) => SearchEventByInterest(container.resolve()));
  di.registerFactory((container) => SearchEventByQuery(container.resolve()));
}
