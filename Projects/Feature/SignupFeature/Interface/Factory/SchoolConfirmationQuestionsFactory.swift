import SwiftUI

public protocol SchoolConfirmationQuestionsFactory {
    associatedtype SomeView: View
    func makeView(schoolConfirmationQuestionsParam: SchoolConfirmationQuestionsParam) -> SomeView
}
