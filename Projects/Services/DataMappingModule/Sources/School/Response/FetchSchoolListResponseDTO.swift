import Foundation

public struct FetchSchoolListResponseDTO: Codable {
    public let schools: [SingleSchoolResponseDTO]

    public init(schools: [SingleSchoolResponseDTO]) {
        self.schools = schools
    }
}
