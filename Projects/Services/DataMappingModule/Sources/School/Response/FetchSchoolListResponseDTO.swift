import Foundation

public struct FetchSchoolListResponseDTO: Codable {

    public let schools: [SingleSchoolResponseDTO]

    internal init(schools: [SingleSchoolResponseDTO]) {
        self.schools = schools
    }
}
