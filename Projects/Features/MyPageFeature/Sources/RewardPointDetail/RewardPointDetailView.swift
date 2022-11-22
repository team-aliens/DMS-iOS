import DesignSystem
import DataMappingModule
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
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    ForEach(PointsType.allCases, id: \.self) {
                        DMSButton(text: $0.display, style: viewModel.pointsType == $0 ? .outlined : .contained, color: .GrayScale.gray6) {
                            viewModel.pointTypeButtonDidTap(type: .all)
                        }
                        .padding(.trailing, 12)
                    }
                }
                .padding(.leading, 24)
                .padding(.top, 16)

                Text("\(viewModel.point?.totalPoint ?? 0)" + " 점")
                    .dmsFont(.title(.large), color: .GrayScale.gray6)
                    .padding(.top, 44)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 44)

                ScrollView {
                    VStack {
                        ForEach(viewModel.point?.poinsts ?? [], id: \.self) { pointList in
                            pointsListCellView(
                                date: pointList.date.toSmallDMSDateString(),
                                name: pointList.name,
                                score: "\(pointList.score)"
                            )
                            .padding(.top, 5)
                            .listRowInsets(EdgeInsets())
                        }
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
    func pointsListCellView(date: String, name: String, score: String) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("8월 4일")
                        .dmsFont(.text(.extraSmall), color: .System.title)

                    Text("무단 외출")
                        .dmsFont(.text(.medium), color: .System.text)
                }
                HStack {
                    Spacer()

                    Text("-5")
                        .dmsFont(.text(.medium), color: .System.error)
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .shadow(color: .GrayScale.gray5.opacity(0.15), blur: 20)
    }
}
