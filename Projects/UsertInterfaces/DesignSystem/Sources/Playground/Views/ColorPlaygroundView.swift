import SwiftUI

struct ColorPlaygroundView: View {
    let colors: [[Color]] = [
        [
            .PrimaryVariant.lighten2,
            .PrimaryVariant.lighten2,
            .PrimaryVariant.primary,
            .PrimaryVariant.darken1,
            .PrimaryVariant.darken2
        ],
        [
            .GrayScale.gray1,
            .GrayScale.gray2,
            .GrayScale.gray3,
            .GrayScale.gray4,
            .GrayScale.gray5,
            .GrayScale.gray6,
            .GrayScale.gray7,
            .GrayScale.gray8,
            .GrayScale.gray9
        ],
        [
            .System.background,
            .System.surface,
            .System.error,
            .System.onError,
            .System.onPrimary,
            .System.onBackground,
            .System.backgroundTitle,
            .System.backgroundText,
            .System.surfaceTitle,
            .System.surfaceText,
            .System.line
        ]
    ]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 10)

    var body: some View {
        ScrollView {
            VStack {
                ForEach(colors, id: \.hashValue) { subColors in
                    LazyVGrid(columns: columns) {
                        ForEach(subColors, id: \.hashValue) { color in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(color)
                                .frame(height: 40)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct ColorPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPlaygroundView()
    }
}
