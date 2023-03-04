import Foundation

public struct MealRepositoryImpl: MealRepository {
    private let session: any RemoteAPIRequestable

    public init(session: any RemoteAPIRequestable) {
        self.session = session
    }

    public func fetchMealList(date: Date) async throws -> [MealEntity] {
        let dateString = date.toSmallDMSString()
        let (data, _) = try await session.data(from: APIConstant.baseURL)
        let response = try JSONDecoder().decode(FetchMealListResponseDTO.self, from: data)
        return response.meals.map { $0.toDomain() }
    }
}
