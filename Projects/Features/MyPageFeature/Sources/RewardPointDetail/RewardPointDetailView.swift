import DesignSystem
import SwiftUI

struct RewardPointDetailView: View {
    @StateObject var viewModel: RewardPointDetailViewModel
    private let rewardPointDetailComponent: RewardPointDetailComponent

    var body: some View {
        NavigationView {
            VStack {
            }
            .navigationTitle("상벌점 현황")
        }
    }
}
