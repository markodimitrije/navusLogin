//
//  LoginRemoteSignalFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

class LoginRemoteSignalFactory {
    
    private let loginRemoteApi: ILoginRemoteApi
    init(loginRemoteApi: ILoginRemoteApi) {
        self.loginRemoteApi = loginRemoteApi
    }
    
    func map(userInput: ILoginCredentials) -> Observable<Bool> {
        return loginRemoteApi.login(loginCredentials: userInput).map {_ in true}
    }
    
}
