import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.tabbarHidden) var tabbarHidden

    private let changeProfileComponent: ChangeProfileComponent
    private let rewardPointDetailComponent: RewardPointDetailComponent
    private let checkPasswordComponent: CheckPasswordComponent

    init(
        viewModel: MyPageViewModel,
        changeProfileComponent: ChangeProfileComponent,
        rewardPointDetailComponent: RewardPointDetailComponent,
        checkPasswordComponent: CheckPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.changeProfileComponent = changeProfileComponent
        self.rewardPointDetailComponent = rewardPointDetailComponent
        self.checkPasswordComponent = checkPasswordComponent
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
                    RewardPointCardView(
                        title: "상점",
                        point: viewModel.profile?.bonusPoint ?? 0,
                        rewardType: .bonusPoint
                    )

                    RewardPointCardView(
                        title: "벌점",
                        point: viewModel.profile?.minusPoint ?? 0,
                        rewardType: .minusPoint
                    )
                }

                VStack(alignment: .leading, spacing: 0) {
                    Button {
                        viewModel.isNavigateRewardPointDetail.toggle()
                    } label: {
                        myPageOptionRowCardView(title: "상벌점 내역 확인")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .cornerRadius(10, corners: [.topLeft, .topRight])
                    }

                    Divider()
                        .padding(.horizontal, 10)

                    Button {
                        viewModel.isNavigateChangePassword.toggle()
                    } label: {
                        myPageOptionRowCardView(title: "비밀번호 변경")
                            .dmsFont(.body(.body2), color: .GrayScale.gray6)
                            .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                    }

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
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
        }
        .dmsBackground()
        .onAppear(perform: viewModel.onAppear)
        .alert("", isPresented: $viewModel.isPresentedLogoutAlert) {
            Button("취소", role: .cancel) {}
            Button("확인", role: .destructive, action: viewModel.confirmLogoutButtonDidTap)
        } message: {
            Text("정말 로그아웃 하시겠습니까?")
                .dmsFont(.body(.body2), color: .GrayScale.gray6)
        }
        .onChange(of: viewModel.isNavigateChangeProfile) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .onChange(of: viewModel.isNavigateChangePassword) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .navigate(
            to: changeProfileComponent.makeView(),
            when: $viewModel.isNavigateChangeProfile
        )
        .navigate(
            to: checkPasswordComponent.makeView(),
            when: $viewModel.isNavigateChangePassword
        )
        .navigate(
            to: rewardPointDetailComponent.makeView(),
            when: $viewModel.isNavigateRewardPointDetail
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
                .dmsShadow(style: .surface)
        }
    }
}
