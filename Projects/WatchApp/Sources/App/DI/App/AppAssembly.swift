import Swinject
import WatchRestAPIModule

struct AppAssembly: Assembly {
    func assemble(container: Container) {
        container.register(JwtStore.self) { _ in
            JwtStoreImpl()
        }.inObjectScope(.container)
    }
}
