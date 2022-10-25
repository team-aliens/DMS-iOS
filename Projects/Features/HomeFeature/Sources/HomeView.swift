import DesignSystem
import SwiftUI
import Utility

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                noticeView()

                Text("오늘의 급식")
                    .dmsFont(.title(.small), color: .GrayScale.gray7)
                    .padding(.top, 24)

                HStack(spacing: 12) {
                    Button {
                        viewModel.selectedDate = viewModel.selectedDate.adding(by: .day, value: -1)
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.GrayScale.gray6)
                    }

                    Button {
                    } label: {
                        Label {
                            Text(viewModel.selectedDateString)
                        } icon: {
                            Image(systemName: "calendar")
                        }
                        .dmsFont(.button(.default), color: .GrayScale.gray6)
                        .padding(.vertical, 8.5)
                        .padding(.horizontal, 12)
                        .overlay {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.GrayScale.gray5, lineWidth: 1)
                        }
                    }

                    Button {
                        viewModel.selectedDate = viewModel.selectedDate.adding(by: .day, value: 1)
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.GrayScale.gray6)
                    }
                }
                .padding(.top, 32)
            }

            GeometryReader { proxy in
                VStack {
                    Spacer()

                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color.GrayScale.gray1
                                        .opacity(0.03),
                                    Color.PrimaryVariant.primary
                                        .opacity(0.15)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: proxy.size.height * 0.5713)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("로고")
                    .dmsFont(.title(.small), color: .GrayScale.gray7)
            }
        }
    }

    @ViewBuilder
    func noticeView() -> some View {
        HStack(spacing: 12) {
            Image(systemName: "megaphone")
                .foregroundColor(.PrimaryVariant.primary)
                .padding(.leading, 24)
                .padding(.vertical, 12)

            Text("이런저런 공지가 있음!")
                .dmsFont(.text(.small), color: .GrayScale.gray6)

            Spacer()

            Image(systemName: "chevron.right")
                .resizable()
                .foregroundColor(.PrimaryVariant.primary)
                .frame(width: 7, height: 12)
                .padding(12)
                .background {
                    Color.PrimaryVariant.lighten2
                        .clipShape(Circle())
                }
                .padding(.trailing, 8)
        }
        .background {
            Color.GrayScale.gray1
        }
        .cornerRadius(100)
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .shadow(
            color: .GrayScale.gray4,
            radius: 20,
            y: 1
        )
    }
}