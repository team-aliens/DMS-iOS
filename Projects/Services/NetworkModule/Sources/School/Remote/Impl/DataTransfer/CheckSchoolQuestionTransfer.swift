//
//  CheckSchoolQuestionTransfer.swift
import DataMappingModule
import DomainModule

public extension CheckSchoolQuestionResponseDTO {
    func toDomain() -> CheckSchoolQuestionEntity {
        return CheckSchoolQuestionEntity(question: question)
    }
}
