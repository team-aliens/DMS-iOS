import SwiftUI

public protocol StudyRoomListFactory {
    associatedtype SomeView: View
    func makeView() -> SomeView
}
