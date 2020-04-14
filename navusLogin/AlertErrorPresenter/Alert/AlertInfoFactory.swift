//
//  AlertInfoFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

class AlertInfoFactory {
    static func make(error: Error) -> AlertInfo {
        let infoDict = ErrorAlertInfoDictionaryFactory.make()
        return infoDict[error.localizedDescription] as? AlertInfo ?? AlertInfo()
    }
}