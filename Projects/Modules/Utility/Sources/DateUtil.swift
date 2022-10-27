import Foundation

public extension String {
    func toDMSDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.date(from: self) ?? .init()
    }

    func toSmallDMSDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.date(from: self) ?? .init()
    }
}

public extension Date {
    func toDMSDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = .init(identifier: "UTC")
        return formatter.string(from: self)
    }

    func toSmallDMSDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = .init(identifier: "UTC")
        return formatter.string(from: self)
    }

    func isSameDay(_ target: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(self, inSameDayAs: target)
    }

    func adding(by component: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: component, value: value, to: self) ?? self
    }

    func fetchAllDatesInCurrentMonth() -> [Date] {
        let calendar = Calendar.current

        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self)) ?? .init()
        let range = calendar.range(of: .day, in: .month, for: self) ?? .init(uncheckedBounds: (1, 28))
        return range.compactMap {
            return calendar.date(byAdding: .day, value: $0 - 1, to: startDate)
        }
    }

    func dayOfWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEEEE"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: self)
    }
}

public extension Date {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }
}
