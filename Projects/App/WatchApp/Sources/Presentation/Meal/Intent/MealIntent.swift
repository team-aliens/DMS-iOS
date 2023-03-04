import Foundation
import WatchRestAPIModule

final class MealIntent: MealIntentProtocol {
    private weak var model: (any MealActionProtocol)?
    private let mealRepository: any MealRepository
    private let watchSessionManager: WatchSessionManager

    init(
        model: any MealActionProtocol,
        mealRepository: any MealRepository,
        watchSessionManager: WatchSessionManager
    ) {
        self.model = model
        self.mealRepository = mealRepository
        self.watchSessionManager = watchSessionManager
    }

    func onAppear() {
        model?.updateIsLoading(isLoading: true)
        Task {
            do {
                let currentDate = Date()
                let mealList = try await mealRepository.fetchMealList(date: currentDate)
                let todayMeal = mealList
                    .filter { $0.date.toSmallDMSString() == currentDate.toSmallDMSString() }
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
