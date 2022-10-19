import Foundation

public struct FetchSchoolListResponseDTO: Encodable {

    public let schools: [SingleSchoolResponseDTO]

    internal init(schools: [SingleSchoolResponseDTO]) {
        self.schools = schools
    }
}
