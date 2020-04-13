//
//  ErrorAlertControllerFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class ErrorAlertControllerFactory {
    static func make(error: Error) -> UIAlertController {
        let alertInfo = AlertInfoFactory.make(error: error)
        return UIAlertController(title: alertInfo.title,
                                 message: alertInfo.text,
                                 preferredStyle: .alert)
    }
}
