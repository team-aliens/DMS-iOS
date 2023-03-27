import Foundation

public extension Date {
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

public extension String {
    func toDMSNoticeDate() -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ .withFullDate, .withDashSeparatorInDate ]
        return formatter.date(from: self) ?? .init()
    }

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
