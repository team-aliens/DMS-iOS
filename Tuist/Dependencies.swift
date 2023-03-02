import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager:
        SwiftPackageManagerDependencies(
            [
                .remote(url: "https://github.com/Quick/Quick.git", requirement: .upToNextMajor(from: "5.0.1")),
                .remote(url: "https://github.com/Quick/Nimble.git", requirement: .upToNextMajor(from: "10.0.0")),
                .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.19.0")),
                .remote(url: "https://github.com/team-aliens/Moya.git", requirement: .branch("master")),
                .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.0"))
            ],
            baseSettings: .settings(
                configurations: [
                    .debug(name: .dev),
                    .release(name: .prod)
                ]
            )
        ),
    platforms: [.iOS]
)
