import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct DMSImage: View {
    public enum Image {
        case pencil
        case logoHorizontal
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

    private func dmsImageToImage() -> SwiftUI.Image {
        switch image {
        case .pencil:
            return DesignSystemAsset.Icons.pencil.suiImage

        case .logoHorizontal:
            return DesignSystemAsset.Icons.dmsHorizontal.suiImage
        }
    }
}
