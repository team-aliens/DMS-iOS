import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel

    init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(viewModel.profile?.gcn ?? "") \(viewModel.profile?.name ?? "Loading...")")
                            .dmsFont(.title(.small), color: .GrayScale.gray7)

                        Text(viewModel.profile?.schoolName ?? "")
                            .dmsFont(.text(.small), color: .GrayScale.gray6)
                    }

                    Spacer()

                    ZStack(alignment: .bottomTrailing) {
                        AsyncImage(url: URL(string: "")) { image in
                            image
                                .resizable()
                                .frame(width: 74, height: 74)
                                .clipShape(Circle())
                        } placeholder: {
                            Color.GrayScale.gray5
                                .frame(width: 74, height: 74)
                                .clipShape(Circle())
                        }

                        Circle()
                            .fill(Color.GrayScale.gray3)
                            .frame(width: 24, height: 24)
                    }
                }
                .padding(.top, 64)

                Text("벌점이 10점이예요. 더 바른 생활을 위해 노력해주세요~")
                    .dmsFont(.text(.small), color: .GrayScale.gray7)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 20)
                    .background {
                        Color.PrimaryVariant.lighten2
                            .cornerRadius(5)
                    }
                    .padding(.top, 60)

                HStack(spacing: 12) {
                    rewardPointCardView(title: "상점", point: viewModel.profile?.bonusPoint ?? 0)

                    rewardPointCardView(title: "벌점", point: viewModel.profile?.minusPoint ?? 0)
                }

                VStack(alignment: .leading, spacing: 0) {
                    Text("상벌점 내역 확인")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)

                    Divider()
                        .padding(.horizontal, 10)

                    Text("비밀번호 변경")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.GrayScale.gray1)
                        .shadow(
                            color: .GrayScale.gray4.opacity(0.24),
                            y: 1,
                            blur: 20
                        )
                }

                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("로그아웃")
                            .dmsFont(.text(.medium), color: .System.error)
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)

                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.GrayScale.gray1)
                        .shadow(
                            color: .GrayScale.gray4.opacity(0.24),
                            y: 1,
                            blur: 20
                        )
                }

                Spacer()
            }
            .padding(.horizontal, 24)
            .dmsBackground()
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: viewModel.onAppear)
    }

    @ViewBuilder
    func rewardPointCardView(title: String, point: Int) -> some View {
        VStack {
            HStack {
                Text(title)
                    .dmsFont(.text(.small), color: .GrayScale.gray6)

                Spacer()
            }
            .padding(.top, 16)

            HStack {
                Spacer()

                Text("\(point)")
                    .dmsFont(.title(.large), color: .GrayScale.gray6)
            }
            .padding(.bottom, 16)
        }
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 95)
        .background {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.PrimaryVariant.primary, lineWidth: 1)
        }
    }
}
