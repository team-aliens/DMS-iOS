import ProjectDescription

public extension ProjectDescription.Path {
    static func relativeToSections(_ path: String) -> Self {
        return .relativeToRoot("Projects/\(path)")
    }
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/Feature/\(path)")
    }
    static func relativeToDomain(_ path: String) -> Self {
        return .relativeToRoot("Projects/Domain/\(path)")
    }
    static func relativeToCore(_ path: String) -> Self {
        return .relativeToRoot("Projects/Core/\(path)")
    }
    static func relativeToShared(_ path: String) -> Self {
        return .relativeToRoot("Projects/Shared/\(path)")
    }
    static var app: Self {
        return .relativeToRoot("Projects/App")
    }
}
