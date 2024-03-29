import Combine
import DesignSystem
import SwiftUI
import PointsDomainInterface

struct RewardPointDetailView: View {
    @StateObject var viewModel: RewardPointDetailViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: RewardPointDetailViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(PointsType.allCases, id: \.self) { type in
                    DMSButton(
                        text: type.display,
                        style: viewModel.pointsType == type ? .shortPaddingContained : .shortPaddingOutlined,
                        color: viewModel.pointsType == type ? .PrimaryVariant.primary : .GrayScale.gray6
                    ) {
                        withAnimation {
                            viewModel.pointsTypeChanged(type: type)
                        }
                    }
                    .padding(.trailing, 12)
                }
            }
            .padding(.leading, 24)
            .padding(.top, 16)

            Text("\(viewModel.point?.totalPoint ?? 0)" + " 점")
                .dmsFont(.headline(.headline2), color: .GrayScale.gray6)
                .padding(.top, 34)
                .padding(.horizontal, 24)
                .padding(.bottom, 24)

            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(height: 10)
                LazyVStack {
                    ForEach(viewModel.point?.poinsts ?? [], id: \.self) { point in
                        pointsListCellView(point: point)
                            .padding(.top, 5)
                            .padding(.horizontal, 24)
                    }
                }

                Spacer()
                    .frame(height: 20)
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .dmsBackButton(dismiss: dismiss)
        .navigationTitle("상벌점 현황")
        .navigationBarTitleDisplayMode(.inline)
        .dmsBackground()
        .dmsToast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }

    @ViewBuilder
    func pointsListCellView(point: PointEntity.SinglePoint) -> some View {
        ZStack {
            Color.System.surface
                .cornerRadius(6)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(point.date.month)월 \(point.date.day)일")
                        .dmsFont(.etc(.caption), color: .GrayScale.gray5)

                    Text(point.name)
                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                }
                HStack {
                    Spacer()

                    Text("\(point.type == .bonus ? "+" : "-")\(point.score)")
                        .dmsFont(.body(.body2), color: point.type == .bonus ? .PrimaryVariant.darken2 : .System.error)
                }

                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .frame(height: 68)
        .dmsShadow(style: .surface)
    }
}
