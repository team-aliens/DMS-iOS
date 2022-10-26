import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

final class HomeViewModel: BaseViewModel {
    @Published var selectedDate = Date()
    @Published var isExistNewNotice = true
    @Published var meals: [String: MealEntity] = [:]
    var selectedDateString: String {
        "\(selectedDate.year)/\(selectedDate.month)/\(selectedDate.day) (\(selectedDate.dayOfWeek()))"
    }
    var selectedDateMeal: MealEntity {
        meals[selectedDate.toSmallDMSDateString()] ?? .init(
            date: "2022-01-01",
            breakfast: [],
            lunch: [],
            dinner: []
        )
    }
}
