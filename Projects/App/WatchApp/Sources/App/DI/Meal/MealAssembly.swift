import Swinject
import WatchRestAPIModule

struct MealAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RemoteMealDataSource.self) { resolver in
            RemoteMealDataSourceImpl(jwtStore: resolver.resolve(JwtStore.self)!)
        }

        container.register(MealRepository.self) { resolver in
            MealRepositoryImpl(remoteDataSource: resolver.resolve(RemoteMealDataSource.self)!)
        }

        container.register(MealFactory.self) { resolver in
            MealFactory(
                mealRepository: resolver.resolve(MealRepository.self)!,
                watchSessionManager: resolver.resolve(WatchSessionManager.self)!
            )
        }
    }
}
