import ProjectDescription
import EnvironmentPlugin

let workspace = Workspace(
    name: env.appName,
    projects: [
        "Projects/App",
        "Projects/WatchApp"
    ]
)
