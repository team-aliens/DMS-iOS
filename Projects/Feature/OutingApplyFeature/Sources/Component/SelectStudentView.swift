import DesignSystem
import SwiftUI

struct SelectStudentView: View {
    @Binding var text: String
    @State var selected = 0

    public init(text: Binding<String>) {
        _text = text
    }
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.GrayScale.gray1)
                .frame(height: 48)
                .dmsShadow(style: .surface)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color.GrayScale.gray5)

                        Divider()
                            .foregroundStyle(Color.GrayScale.gray3)
                            .frame(width: 2)
                            .padding(.leading, 14)
                            .padding(.vertical, 10)

                        TextField("", text: $text)
                            .dmsFont(.body(.body2), color: .GrayScale.gray10)
                            .padding(.leading, 16)

                        Button(action: {
                            text = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(Color.GrayScale.gray9)
                        })
                    }
                        .padding(.horizontal, 22)
                )
                .padding(.horizontal, 24)

            ScrollView(showsIndicators: false) {
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
                Button(action: {
                    selected += 1
                }, label: {
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.GrayScale.gray3, lineWidth: 1)

                        HStack(spacing: 16) {
                            Circle()
                                .fill(Color.GrayScale.gray5)
                                .padding(.vertical, 12)
                                .padding(.leading, 16)

                            Text("1111 홍길동")
                                .dmsFont(.etc(.button), color: .GrayScale.gray6)

                            Spacer()
                        }
                    }
                    .frame(height: 64)
                })
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)

            DMSWideButton(text: "\(selected)명 선택", color: .PrimaryVariant.primary)
                .padding(.top, 24)
                .padding(.horizontal, 24)
        }
    }
}
