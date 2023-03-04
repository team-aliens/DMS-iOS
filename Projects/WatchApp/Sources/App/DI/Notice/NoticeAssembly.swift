import Swinject
import WatchRestAPIModule

struct NoticeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RemoteNoticeDataSource.self) { resolver in
            RemoteNoticeDataSourceImpl(jwtStore: resolver.resolve(JwtStore.self)!)
        }

        container.register(NoticeRepository.self) { resolver in
            NoticeRepositoryImpl(remoteDataSource: resolver.resolve(RemoteNoticeDataSource.self)!)
        }

        container.register(NoticeFactory.self) { resolver in
            NoticeFactory(noticeRepository: resolver.resolve(NoticeRepository.self)!)
        }
    }
}
