import OutingDomainInterface
import BaseFeature
import SwiftUI

final class OutingApplyViewModel: BaseViewModel {
    private let fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase

    public init(
        fetchMyOutingApplicationItemUseCase: any FetchMyOutingApplicationItemUseCase
    ) {
        self.fetchMyOutingApplicationItemUseCase = fetchMyOutingApplicationItemUseCase
    }
}
