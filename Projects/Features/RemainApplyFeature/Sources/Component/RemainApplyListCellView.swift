import DesignSystem
import DomainModule
import SwiftUI

struct RemainApplyListCellView: View {
    @StateObject var viewModel: RemainApplyViewModel

    let dummy1 = RemainOptionEntity(
        id: "0",
        title: "금요 귀가",
        description: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """
    )
    let dummy2 = RemainOptionEntity(
        id: "1",
        title: "토요 귀가",
        description: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """
    )
    let dummy3 = RemainOptionEntity(
        id: "2",
        title: "잔류",
        description: """
            금요일 일과가 모두 끝나고
            8시 30분 이후부터9시 30분까지 귀가하고
            일요일 6시 30분 부터 9시 30분까지 귀사해야 합니다.

            혹시나 개인 일정으로 부득이하기 금요일이 아닌, 토요일
            또는 일요일에 귀가해야 하는 학생들은 사감 선생님께
            말씀부탁드립니다.
            """
    )

    var body: some View {
        VStack(spacing: 12) {
            remainApplyListCellView(list: dummy1, applyType: .friday)

            remainApplyListCellView(list: dummy2, applyType: .saturday)

            remainApplyListCellView(list: dummy3, applyType: .stay)
        }
    }

    @ViewBuilder
    // swiftlint:disable function_body_length
    func remainApplyListCellView(list: RemainOptionEntity, applyType: ApplyType) -> some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    viewModel.selectedType = list.title
                    viewModel.selectedNum = Int(list.id) ?? 10
                }, label: {
                    HStack {
                        Text(list.title)
                            .dmsFont(.title(.title2), color: viewModel.selectedNum == applyType.rawValue
                                     ? .System.primary : .GrayScale.gray7)
                            .frame(height: 32)
                            .padding(.vertical, 14)
                            .padding(.horizontal, 20)

                        if viewModel.isAlreadyApplied == true && viewModel.appliedNum == applyType.rawValue {
                            Text("신청 완료")
                                .dmsFont(.etc(.button), color: .PrimaryVariant.primary)
                                .frame(height: 22)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 14)
                                .background(Color.PrimaryVariant.lighten2)
                                .cornerRadius(24)
                        }
                    }

                    Spacer()

                    Image(systemName: viewModel.isDetailTapped == true && viewModel.selectedNum == applyType.rawValue
                          ? "chevron.up" : "chevron.down")
                        .foregroundColor(viewModel.selectedNum == applyType.rawValue
                                         ? .System.primary : .GrayScale.gray7)
                        .padding(.trailing, 25)
                        .onTapGesture {
                            viewModel.selectedNum = applyType.rawValue
                            viewModel.selectedType = list.title
                            viewModel.isDetailTapped.toggle()
                        }
                })
            }
            if viewModel.isDetailTapped == true && viewModel.selectedNum == applyType.rawValue {
                Text(list.description)
                    .multilineTextAlignment(.leading)
                    .dmsFont(.body(.body3), color: .GrayScale.gray9)
                    .padding([.horizontal, .bottom], 20)
            }
        }
        .background(Color.System.surface)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 1)
                .stroke(viewModel.selectedNum == applyType.rawValue ?
                        Color.System.primary : .clear, lineWidth: 1.5)
        )
        .padding(.bottom, 12)
        .dmsShadow(style: .surface)
    }
    // swiftlint:enable function_body_length
}

enum ApplyType: Int {
    case friday = 0
    case saturday
    case stay
}
