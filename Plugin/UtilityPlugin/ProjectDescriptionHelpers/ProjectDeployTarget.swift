import Foundation
import ProjectDescription

public enum ProjectDeployTarget: String {
    case dev = "DEV"
    case prod = "PROD"

    public var configurationName: ConfigurationName {
        ConfigurationName.configuration(self.rawValue)
    }
}
