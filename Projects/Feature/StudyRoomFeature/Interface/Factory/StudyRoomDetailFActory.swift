import SwiftUI

public protocol StudyRoomDetailFactory {
    associatedtype SomeView: View
    func makeView(studyRoomParam: StudyRoomParam, timeSlot: String) -> SomeView
}
