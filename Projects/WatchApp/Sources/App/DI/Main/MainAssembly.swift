import Swinject

struct MainAssembly: Assembly {
    func assemble(container: Container) {
        container.register(MainFactory.self) { resolver in
            MainFactory(mealFactory: resolver.resolve(MealFactory.self)!)
        }
    }
}
