import BaseFeature
import UIKit
import Combine
import DomainModule

final class RewardPointDetailViewModel: BaseViewModel {

    private var fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase

    init(
        fetchDetailNoticeUseCase: any FetchDetailNoticeUseCase,
        id: String
    ) {
        self.fetchDetailNoticeUseCase = fetchDetailNoticeUseCase
        super.init()
    }
}
