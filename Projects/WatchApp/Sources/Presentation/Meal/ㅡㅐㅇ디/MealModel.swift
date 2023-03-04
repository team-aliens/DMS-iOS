import Foundation
import WatchRestAPIModule

final class MealModel: ObservableObject, MealStateProtocol {
    @Published var meal: MealEntity? = nil
    @Published var isLoading: Bool = false
    @Published var isError: Bool = false
}

extension MealModel: MealActionProtocol {
    func updateMeal(meal: MealEntity?) {
        self.meal = meal
    }

    func updateIsLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }

    func updateIsError(isError: Bool) {
        self.isError = isError
    }
}
