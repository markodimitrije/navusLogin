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
    var email = ""
    var password = ""
}
