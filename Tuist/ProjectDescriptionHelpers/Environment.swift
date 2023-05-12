import ProjectDescription

//public enum Environment {
//    public static let appName = "DMS-Aliens"
//    public static let targetName = "DMS-Aliens"
//    public static let targetTestName = "\(targetName)Tests"
//    public static let organizationName = "com.team.aliens"
//    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
//    public static let platform = Platform.iOS
//    public static let baseSetting: SettingsDictionary = SettingsDictionary()
//}

public struct ProjectEnvironment {
    public let appName: String
    public let targetName: String
    public let targetTestName: String
    public let organizationName: String
    public let deploymentTarget: DeploymentTarget
    public let platform: Platform
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment (
    appName: "DMS-Aliens",
    targetName: "DMS-Aliens",
    targetTestName: "DMS-AliensTests",
    organizationName: "com.team.aliens",
    deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
    platform: .iOS,
    baseSetting: [:]
)
