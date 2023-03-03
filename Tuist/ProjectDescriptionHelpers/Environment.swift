import ProjectDescription

public enum Environment {
    public static let appName = "DMS-Aliens"
    public static let targetName = "DMS-Aliens"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "com.team.aliens"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
    public static let watchSetting: SettingsDictionary = [
        "GENERATE_INFOPLIST_FILE": true,
        "CURRENT_PROJECT_VERSION": "1.0",
        "MARKETING_VERSION": "1.0",
        "INFOPLIST_KEY_UISupportedInterfaceOrientations": [
            "UIInterfaceOrientationPortrait",
            "UIInterfaceOrientationPortraitUpsideDown",
        ],
        "INFOPLIST_KEY_WKCompanionAppBundleIdentifier": "io.tuist.App",
        "INFOPLIST_KEY_WKRunsIndependentlyOfCompanionApp": false,
    ]
}
