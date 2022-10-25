import BaseFeature
import Combine
import Foundation
import Utility

final class HomeViewModel: BaseViewModel {
    @Published var selectedDate = Date()
    var selectedDateString: String {
        "\(selectedDate.year)/\(selectedDate.month)/\(selectedDate.day) (\(selectedDate.dayOfWeek()))"
    }
}
