import Swinject
import WatchRestAPIModule

struct DetailNoticeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DetailNoticeFactory.self) { resolver in
            DetailNoticeFactory(noticeRepository: resolver.resolve(NoticeRepository.self)!)
        }
    }
}
