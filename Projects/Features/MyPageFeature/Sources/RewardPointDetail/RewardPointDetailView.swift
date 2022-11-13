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

    @ViewBuilder
    func pointListCellView(date: String, title: String, score: String) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            HStack {
                VStack(alignment: .leading) {
                    Text(date)
                        .dmsFont(.text(.medium), color: .System.title)

                    Text(title)
                        .dmsFont(.text(.extraSmall), color: .System.text)

                    Text(score)
                        .dmsFont(.text(.extraSmall), color: .System.text)
                }
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .shadow(color: .GrayScale.gray5.opacity(0.15), blur: 20)

    }
}
