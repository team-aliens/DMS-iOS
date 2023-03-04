import Foundation

extension Date {
    func toDMSDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }

    func toSmallDMSString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }
}

extension String {
    func toDMSDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }

    func toSmallDMSDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }
}
