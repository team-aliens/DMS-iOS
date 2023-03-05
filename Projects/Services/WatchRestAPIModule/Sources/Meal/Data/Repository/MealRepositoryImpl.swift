import Foundation

public struct MealRepositoryImpl: MealRepository {
    private let remoteDataSource: any RemoteMealDataSource

    public init(remoteDataSource: any RemoteMealDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    public func fetchMealList(date: Date) async throws -> [MealEntity] {
        try await remoteDataSource.fetchMealList(date: date)
    }
}
