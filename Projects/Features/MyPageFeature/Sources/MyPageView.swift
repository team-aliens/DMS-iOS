import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel

    private let changeProfileComponent: ChangeProfileComponent
    private let rewardPointDetailComponent: RewardPointDetailComponent

    init(
        viewModel: MyPageViewModel,
        changeProfileComponent: ChangeProfileComponent,
        rewardPointDetailComponent: RewardPointDetailComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changeProfileComponent = changeProfileComponent
        self.rewardPointDetailComponent = rewardPointDetailComponent
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\(viewModel.profile?.gcn ?? "") \(viewModel.profile?.name ?? "Loading...")")
                            .dmsFont(.title(.title1), color: .GrayScale.gray7)

                        Text(viewModel.profile?.schoolName ?? "")
                            .dmsFont(.body(.body3), color: .GrayScale.gray6)
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
                            .overlay {
                                DMSImage(.pencil)
                                    .frame(width: 16, height: 16)
                            }
                    }
                    .onTapGesture {
                        viewModel.profileImageDidTap()
                    }
                }
                .padding(.top, 48)

                Text(viewModel.profile?.phrase ?? "")
                    .dmsFont(.body(.body3), color: .GrayScale.gray7)
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
                    NavigationLink {
                        DeferView {
                            rewardPointDetailComponent.makeView()
                        }
                    } label: {
                        myPageOptionRowCardView(title: "상벌점 내역 확인")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                    }

                    Divider()
                        .padding(.horizontal, 10)

                    myPageOptionRowCardView(title: "비밀번호 변경")
                        .dmsFont(.body(.body2), color: .GrayScale.gray6)
                        .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                }
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.GrayScale.gray1)
                        .dmsShadow()
                }

                VStack(alignment: .leading, spacing: 0) {
                    myPageOptionRowCardView(title: "로그아웃")
                        .dmsFont(.body(.body2), color: .System.error)
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
            Button("확인", role: .destructive, action: viewModel.confirmLogoutButtonDidTap)
        } message: {
            Text("정말 로그아웃 하시겠습니까?")
                .dmsFont(.body(.body2), color: .GrayScale.gray6)
        }
        .navigate(
            to: changeProfileComponent.makeView(),
            when: $viewModel.isNavigateChangeProfile
        )
    }

    @ViewBuilder
    func myPageOptionRowCardView(title: String) -> some View {
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

    @ViewBuilder
    func rewardPointCardView(title: String, point: Int) -> some View {
        VStack {
            HStack {
                Text(title)
                    .dmsFont(.body(.body3), color: .GrayScale.gray6)

                Spacer()
            }
            .padding(.top, 16)

            HStack {
                Spacer()

                Text("\(point)")
                    .dmsFont(.headline(.headline2), color: .GrayScale.gray6)
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
