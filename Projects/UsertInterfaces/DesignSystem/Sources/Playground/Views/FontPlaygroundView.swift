import SwiftUI

struct FontPlaygroundView: View {
    let fonts: [(String, [DMSFontStyle])] = [
        ("Headline", [
            .headline(.headline1),
            .headline(.headline2),
            .headline(.headline3)
        ]),
        ("Title", [
            .title(.title1),
            .title(.title2),
            .title(.subTitle1)
        ]),
        ("Body", [
            .body(.body1),
            .body(.body2),
            .body(.body3)
        ]),
        ("Etc", [
            .etc(.caption),
            .etc(.overline),
            .etc(.button)
        ])
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(fonts, id: \.0) { proto in
                    Section {
                        Text(proto.0)
                            .dmsFont(.title(.title1))
                    }

                    VStack(alignment: .leading) {
                        ForEach(proto.1, id: \.hashValue) { item in
                            Text("SampleText")
                                .dmsFont(item)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FontPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        FontPlaygroundView()
    }
}
