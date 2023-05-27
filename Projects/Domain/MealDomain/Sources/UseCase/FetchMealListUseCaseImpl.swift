import Combine
import DomainModule
import ErrorModule

public struct FetchMealListUseCaseImpl: FetchMealListUseCase {
    private let mealRepository: any MealRepository

    public init(mealRepository: any MealRepository) {
        self.mealRepository = mealRepository
    }

    public func execute(date: String) -> AnyPublisher<[MealEntity], Error> {
        mealRepository.fetchMealList(date: date)
    }
}
