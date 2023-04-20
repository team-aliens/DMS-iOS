import Foundation

public final class RemoteMealDataSourceImpl: BaseRemoteDataSource<MealAPI>, RemoteMealDataSource {
    public func fetchMealList(date: Date) async throws -> [MealEntity] {
        let dateString = date.toSmallDMSString()
        let response = try await request(
            .fetchMealList(dateString),
            dto: FetchMealListResponseDTO.self
        )
        return response.toDomain()
    }
}
