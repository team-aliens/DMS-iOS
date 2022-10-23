import Foundation

public struct FeaturesStorageModel: Codable {
    public var meal: Bool = false
    public var notice: Bool = false
    public var point: Bool = false

    public init(meal: Bool, notice: Bool, point: Bool) {
        self.meal = meal
        self.notice = notice
        self.point = point
    }

    public init() {}
}

extension FeaturesStorageModel: RawRepresentable {
    public init?(rawValue: String) {
        guard
            let data = rawValue.data(using: .utf8),
            let result = try? JSONDecoder().decode(FeaturesStorageModel.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard
            let data = try? JSONEncoder().encode(self),
            let result = String(data: data, encoding: .utf8)
        else {
            return """
{
    "meal": false,
    "notice": false,
    "point": false
}
"""
        }
        return result
    }
}
