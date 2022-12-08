import ProjectDescription

public extension ConfigurationName {
    static var dev: ConfigurationName { configuration(ProjectDeployTarget.dev.rawValue) }
    static var prod: ConfigurationName { configuration(ProjectDeployTarget.prod.rawValue) }
}
