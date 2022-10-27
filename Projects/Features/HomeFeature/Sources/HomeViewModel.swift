import BaseFeature
import Combine
import DomainModule
import ErrorModule
import Foundation
import Utility

final class HomeViewModel: BaseViewModel {
    @Published var selectedDate = Date()
    @Published var isExistNewNotice = true
    @Published var meals: [String: MealEntity] = [:]
    @Published var prevMonth = Date().month
    var selectedDateString: String {
        "\(selectedDate.year)/\(selectedDate.month)/\(selectedDate.day) (\(selectedDate.dayOfWeek()))"
    }
    var selectedDateMeal: MealEntity {
        meals[selectedDate.toSmallDMSDateString()] ?? .init(
            date: selectedDate.toSmallDMSDateString(),
            breakfast: [],
            lunch: [],
            dinner: []
        )
    }

    private let fetchMealListUseCase: any FetchMealListUseCase

    init(
        fetchMealListUseCase: any FetchMealListUseCase
    ) {
        self.fetchMealListUseCase = fetchMealListUseCase
        super.init()

        addCancellable(
            $selectedDate.setFailureType(to: DmsError.self).eraseToAnyPublisher()
        ) { [weak self] date in
            if self?.prevMonth != date.month {
                self?.fetchMealList()
            }
            self?.prevMonth = date.month
        }
    }

    func fetchMealList() {
        addCancellable(
            fetchMealListUseCase.execute(date: selectedDate.toSmallDMSDateString())
        ) { [weak self] meals in
            meals.forEach { meal in
                self?.meals[meal.date] = meal
            }
        }
    }
}
