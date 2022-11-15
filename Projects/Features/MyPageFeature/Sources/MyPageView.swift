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
                .padding(.top, 48)

                Text(viewModel.profile?.phrase ?? "")
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
                    myPageOptionRowCardView(title: "상벌점 내역 확인")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                        .cornerRadius(10, corners: [.topLeft, .topRight])

                    Divider()
                        .padding(.horizontal, 10)

                    myPageOptionRowCardView(title: "비밀번호 변경")
                        .dmsFont(.text(.medium), color: .GrayScale.gray6)
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.GrayScale.gray1)
                        .dmsShadow()
                }

                VStack(alignment: .leading, spacing: 0) {
                    myPageOptionRowCardView(title: "로그아웃", action: viewModel.logoutButtonDidTap)
                        .dmsFont(.text(.medium), color: .System.error)
                        .onTapGesture(perform: viewModel.logoutButtonDidTap)
                        .cornerRadius(10)
                }
                .frame(maxWidth: .infinity)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.GrayScale.gray1)
                        .dmsShadow()
                }

                Spacer()
            }
            .padding(.horizontal, 24)
            .dmsBackground()
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: viewModel.onAppear)
        .alert("", isPresented: $viewModel.isPresentedLogoutAlert) {
            Button("취소", role: .cancel) {}
            Button("로그아웃", role: .destructive, action: viewModel.confirmLogoutButtonDidTap)
        } message: {
            Text("정말 로그아웃 하시겠습니까?")
                .dmsFont(.text(.medium), color: .GrayScale.gray6)
        }
    }

    @ViewBuilder
    func myPageOptionRowCardView(title: String, action: @escaping () -> Void = {}) -> some View {
        Button(action: action) {
            HStack {
                Text(title)

                Spacer()
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .background {
                Color.GrayScale.gray1
                    .dmsShadow()
            }
        }
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
                .dmsShadow()
        }
    }
}
