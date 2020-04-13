//
//  EmptyUserInputMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation
@testable import navusLogin

class EmptyUserInputMock: ILoginCredentials {
    func getDictionary() -> [String : String] {
        return ["email": email, "password": password]
    } // DRY !!
    var email = ""
    var password = ""
}


class InvalidPassUserInputMock: ILoginCredentials {
    func getDictionary() -> [String : String] {
        return ["email": email, "password": password]
    }
    var email = "john.doe@gmail.com"
    var password = ""
}

class InvalidEmailUserInputMock: ILoginCredentials {
    func getDictionary() -> [String : String] {
        return ["email": email, "password": password]
    }
    var email = ""
    var password = "123456"
}

class ValidUserInputMock: ILoginCredentials {
    func getDictionary() -> [String : String] {
        return ["email": email, "password": password]
    }
    var email = "john.doe@gmail.com"
    var password = "123456"
}
