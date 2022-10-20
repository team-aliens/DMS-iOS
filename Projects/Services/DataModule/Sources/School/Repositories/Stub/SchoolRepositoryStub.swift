//
//  SchoolRepositoryStub.swift
//  DataModule
//
//  Created by 김대희 on 2022/10/20.
//  Copyright © 2022 com.team.aliens. All rights reserved.
//

import Combine
import DataMappingModule
import DomainModule
import ErrorModule
import NetworkModule

public struct SchoolRepositoryStub: SchoolRepository {
    private let remoteSchoolDataSource: any RemoteSchoolDataSource

    public init(remoteSchoolDataSource: any RemoteSchoolDataSource) {
        self.remoteSchoolDataSource = remoteSchoolDataSource
    }

    public func getSchoolList() -> AnyPublisher<[SchoolEntity], DmsError> {
        Just([
            SchoolEntity(
                id: "aa-bb-pk",
                name: "대덕소프트웨어마이스터고등학교",
                address: "대전광역시 유성구 가정북로 76"
            )
        ]).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()

    }

    public func getSchoolQuestion(authCode: String) -> AnyPublisher<CheckSchoolQuestionEntity, DmsError> {
        Just(CheckSchoolQuestionEntity(question: "")).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()

    }

    public func checkSchoolQuestion(schoolID: String, answer: String) -> AnyPublisher<Void, DmsError> {
        Just(()).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()

    }

    public func checkSchoolCode(schoolID: String, code: String) -> AnyPublisher<CheckSchoolCodeEntity, DmsError> {
        Just(CheckSchoolCodeEntity(schoolID: schoolID)).setFailureType(to: DmsError.self)
            .eraseToAnyPublisher()
    }
}
