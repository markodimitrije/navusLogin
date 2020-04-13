//
//  AcceptLoginValidatorMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

class AcceptLoginValidatorMock: ILoginValidator {
    func validate(userInput: ILoginCredentials) -> ValidationEnum {
        return .valid
    }
}
