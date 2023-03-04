import Foundation
import WatchRestAPIModule

final class MealIntent: MealIntentProtocol {
    private weak var model: (any MealActionProtocol)?
    private let mealRepository: any MealRepository

    init(
        model: any MealActionProtocol,
        mealRepository: any MealRepository
    ) {
        self.model = model
        self.mealRepository = mealRepository
    }

    func onAppear() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let currentDate = Date()
                let mealList = try await mealRepository.fetchMealList(date: currentDate)
                let todayMeal = mealList.filter { $0.date.compare(currentDate) == .orderedSame }
                    .first
                model?.updateMeal(meal: todayMeal)
            } catch {
                model?.updateIsError(isError: true)
            }
            model?.updateIsLoading(isLoading: false)
        }
    }

    func refresh() {
        Task {
            do {
                let currentDate = Date()
                let mealList = try await mealRepository.fetchMealList(date: currentDate)
                let todayMeal = mealList.filter { $0.date.compare(currentDate) == .orderedSame }
                    .first
                model?.updateMeal(meal: todayMeal)
            } catch {
                model?.updateIsError(isError: true)
            }
        }
    }
}
