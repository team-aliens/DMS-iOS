import SwiftUI

public protocol StudyRoomDetailFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
