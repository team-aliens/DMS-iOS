import Foundation

public struct MyProfileEntity: Equatable {
    public let schoolName: String
    public let name: String
    public let gcn: String
    public let bonusPoint: Int
    public let minusPoint: Int
    public let phrase: String

    public init(schoolName: String,
                name: String,
                gcn: String,
                bonusPoint: Int,
                minusPoint: Int,
                phrase: String) {
        self.schoolName = schoolName
        self.name = name
        self.gcn = gcn
        self.bonusPoint = bonusPoint
        self.minusPoint = minusPoint
        self.phrase = phrase
    }
}
