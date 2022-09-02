//
//  ModelJSON.swift
//  MyTraineeTask
//
//  Created by Artyom Ivanov on 02.09.2022.
//

import Foundation

struct Company: Decodable {
    var company: Info
}


struct Info: Decodable {
    var name: String
    var employees: [Employer]
}


struct Employer: Decodable {
    var name: String
    var phone_number: String
    var skills: [String]
}
