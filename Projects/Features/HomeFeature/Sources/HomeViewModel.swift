import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

final class HomeViewModel: BaseViewModel {
    @Published var selectedDate = Date()
    @Published var isExistNewNotice = true
    @Published var meals: [String: MealEntity] = [:]
    var selectedDateString: String {
        "\(selectedDate.year)/\(selectedDate.month)/\(selectedDate.day) (\(selectedDate.dayOfWeek()))"
    }
    var selectedDateMeal: MealEntity {
        meals[selectedDate.toSmallDMSDateString()] ?? .init(
            date: "2022-01-01",
            breakfast: ["이삭토스트","크링클컷감자튀김/케첩","시리얼/우유","후르츠푸딩","873.6 Kcal"],
            lunch: ["백미밥","콩나물두부된장국","삼겹살김치볶음","새송이버섯전/양념장","배추김치","921.7 Kcal"],
            dinner: ["백미밥", "바게트프랜치토스트", "된장찌개", "숙주나물무침", "오리훈제양파구이/머스타드", "배추김치", "골라먹는우유", "983.7Kcal"]
        )
    }
}
