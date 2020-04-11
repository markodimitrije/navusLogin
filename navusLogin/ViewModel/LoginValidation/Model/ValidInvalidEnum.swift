//
//  ValidInvalidEnum.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

enum ValidInvalidEnum {
    case valid
    case invalid(Error)
}

extension ValidInvalidEnum: Equatable {
    static func == (lhs: ValidInvalidEnum, rhs: ValidInvalidEnum) -> Bool {
        lhs.self == rhs.self
    }
}
