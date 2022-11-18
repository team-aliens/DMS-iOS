import DesignSystem
import SwiftUI

struct RewardPointDetailView: View {
    @StateObject var viewModel: RewardPointDetailViewModel
    private let rewardPointDetailComponent: RewardPointDetailComponent

    init(
        viewModel: RewardPointDetailViewModel,
        rewardPointDetailComponent: RewardPointDetailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.rewardPointDetailComponent = rewardPointDetailComponent
    }

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                    }
                    .padding(.horizontal, 24)
                }
                .navigationTitle("상벌점 현황")
                .navigationBarTitleDisplayMode(.inline)
                .dmsBackground()
            }
        }
    }
}
