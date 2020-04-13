//
//  ErrorAlertInfoDict.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

class ErrorAlertInfoDictionaryFactory {
    static func make() -> [String: Any] {
        var dict = [String: Any]()
        // LoginError pairs
        dict += noConnectionPair()
        dict += unknownUserPair()
        // LoginValidationError pairs
        dict += emailNotValidPair()
        dict += passNotValidPair()
        dict += fieldIsEmptyPair()
        return dict
    }
    
    static private func noConnectionPair() -> [String: Any] {
        let alertInfo = getAlertInfo(titleKeyString: "noConnection.title",
                                     textKeyString: "noConnection.text")
        return [LoginError.noConnection.getHash(): alertInfo]
    }
    
    static private func unknownUserPair() -> [String: Any] {
        let alertInfo = getAlertInfo(titleKeyString: "unknownUser.title",
                                     textKeyString: "unknownUser.text")
        return [LoginError.unknownUser.getHash(): alertInfo]
    }
    
    static private func emailNotValidPair() -> [String: Any] {
        let alertInfo = getAlertInfo(titleKeyString: "emailNotValid.title",
                                     textKeyString: "emailNotValid.text")
        return [LoginValidationError.emailNotValid.getHash(): alertInfo]
    }
    
    static private func passNotValidPair() -> [String: Any] {
        let alertInfo = getAlertInfo(titleKeyString: "passNotValid.title",
                                     textKeyString: "passNotValid.text")
        return [LoginValidationError.passNotValid.getHash(): alertInfo]
    }
    
    static private func fieldIsEmptyPair() -> [String: Any] {
        let alertInfo = getAlertInfo(titleKeyString: "fieldIsEmpty.title",
                                     textKeyString: "fieldIsEmpty.text")
        return [LoginValidationError.fieldIsEmpty.getHash(): alertInfo]
    }
    
    static private func getAlertInfo(titleKeyString: String, textKeyString: String) -> AlertInfo {
        let title = NSLocalizedString(titleKeyString, comment: "")
        let text = NSLocalizedString(textKeyString, comment: "")
        return AlertInfo(title: title, text: text, btnText: [])
    }
}
