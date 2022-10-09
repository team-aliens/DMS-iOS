import SwiftUI

struct FontPlaygroundView: View {
    let fonts: [(String, [DMSFontStyle])] = [
        ("Title", [
            .title(.extraLarge),
            .title(.large),
            .title(.medium),
            .title(.small),
            .title(.extraSmall)
        ]),
        ("Text", [
            .text(.twoExtraLarge),
            .text(.extraLarge),
            .text(.large),
            .text(.medium),
            .text(.small),
            .text(.extraSmall),
            .text(.twoExtraSmall)
        ]),
        ("Button", [
            .button(.default)
        ])
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(fonts, id: \.0) { proto in
                    Section {
                        Text(proto.0)
                            .dmsFont(.title(.extraLarge))
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
