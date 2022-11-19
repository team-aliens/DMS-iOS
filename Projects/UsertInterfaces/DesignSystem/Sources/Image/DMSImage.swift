import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct DMSImage: View {
    public enum Image {
        case pencil
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        dmsImageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    @ViewBuilder
    private func dmsImageToImage() -> SwiftUI.Image {
        switch image {
        case .pencil:
            DesignSystemAsset.Icons.pencil.suiImage
        }
    }
}
