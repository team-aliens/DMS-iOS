import DataModule
import DomainModule
import NeedleFoundation
import NetworkModule

extension WidgetComponent {
    var remoteNoticeDataSource: any RemoteNoticeDataSource {
        shared {
            RemoteNoticeDataSourceImpl(keychain: keychain)
        }
    }

    var noticeRepository: any NoticeRepository {
        shared {
            NoticeRepositoryImpl(remoteNoticeDataSource: remoteNoticeDataSource)
        }
    }

    var fetchNoticeListUseCase: any FetchNoticeListUseCase {
        shared {
            FetchNoticeListUseCaseImpl(noticeRepository: noticeRepository)
        }
    }
}
