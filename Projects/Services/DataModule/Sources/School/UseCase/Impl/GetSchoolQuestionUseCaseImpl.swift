//
//  GetSchoolQuestionUseCaseImpl.swift
//  DataModuleTests
//
//  Created by 김대희 on 2022/10/20.
//  Copyright © 2022 com.team.aliens. All rights reserved.
//

import Combine
import DataMappingModule
import DomainModule
import ErrorModule

public struct GetSchoolQuestionUseCaseImpl: GetSchoolQuestionUseCase {

    private let schoolRepository: any SchoolRepository

    public init(schoolRepository: any SchoolRepository) {
        self.schoolRepository = schoolRepository
    }

    public func execute(authCode: String) -> AnyPublisher<String, DmsError> {
        schoolRepository.getSchoolQuestion(authCode: authCode)
    }

}
