import Swinject
import WatchRestAPIModule

struct AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(JwtStore.self) { _ in
            JwtStoreImpl()
        }.inObjectScope(.container)

        container.register(WatchSessionManager.self) { resolver in
            WatchSessionManager(jwtStore: resolver.resolve(JwtStore.self)!)
        }.inObjectScope(.container)
    }
}
