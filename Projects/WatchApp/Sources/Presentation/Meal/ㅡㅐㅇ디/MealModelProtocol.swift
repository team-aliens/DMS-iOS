import WatchRestAPIModule

protocol MealStateProtocol {
    var meal: MealEntity? { get }
    var isLoading: Bool { get }
    var isError: Bool { get }
}

protocol MealActionProtocol: AnyObject {
    func updateMeal(meal: MealEntity?)
    func updateIsLoading(isLoading: Bool)
    func updateIsError(isError: Bool)
}
