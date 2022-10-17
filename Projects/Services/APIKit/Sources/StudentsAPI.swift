import Moya
import DataMappingModule
import ErrorModule

public enum StudentsAPI {
    
}

extension StudentsAPI: DmsAPI {
    public var domain: DmsDomain {
        
    }
    
    public var urlPath: String {
        <#code#>
    }
    
    public var errorMap: [Int : ErrorModule.DmsError] {
        <#code#>
    }
    
    public var method: Moya.Method {
        <#code#>
    }
    
    public var task: Moya.Task {
        <#code#>
    }
    
    public var jwtTokenType: JwtTokenType {
        <#code#>
    }
    
    
}
