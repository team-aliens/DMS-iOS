import DesignSystem
import Foundation
import SwiftUI

enum DisplayPointPart {
    case both
    case bonus
    case minus
}

extension DisplayPointPart {
    var display: String {
        switch self {
        case .bonus:
            return "상점"

        case .minus:
            return "벌점"

        case .both:
            return ""
        }
    }

    var foreground: Color {
        switch self {
        case .bonus:
            return .PrimaryVariant.darken2

        case .minus:
            return .ErrorVariant.darken1

        case .both:
            return .clear
        }
    }
}
