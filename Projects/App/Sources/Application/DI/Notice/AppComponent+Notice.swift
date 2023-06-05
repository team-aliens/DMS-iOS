import NeedleFoundation
import NoticeDomain
import NoticeDomainInterface

public extension AppComponent {
    var remoteNoticeDataSource: any RemoteNoticeDataSource {
        shared {
//            RemoteNoticeDataSourceStub()
            RemoteNoticeDataSourceImpl(keychain: keychain)
        }
    }

    var noticeRepository: any NoticeRepository {
        shared {
            NoticeRepositoryImpl(remoteNoticeDataSource: remoteNoticeDataSource)
        }
    }

    var fetchWhetherNewNoticeUseCase: any FetchWhetherNewNoticeUseCase {
        shared {
            FetchWhetherNewNoticeUseCaseImpl(noticeRepository: noticeRepository)
        }
    }

    var fetchNoticeListUseCase: any FetchNoticeListUseCase {
        shared {
            FetchNoticeListUseCaseImpl(noticeRepository: noticeRepository)
        }
    }

    var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase {
        shared {
            FetchDetailNoticeUseCaseImpl(noticeRepository: noticeRepository)
        }
    }
}
