import Foundation

public struct FetchSchoolListEntity: Equatable {

    public let schools: [SchoolEntity]

    public init(schools: [SchoolEntity]) {
        self.schools = schools
    }
}
