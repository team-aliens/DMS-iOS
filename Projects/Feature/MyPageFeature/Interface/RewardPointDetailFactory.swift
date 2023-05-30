import SwiftUI

public protocol RewardPointDetailFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
