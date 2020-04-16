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
    
    func createWith(sig: Observable<ILoginCredentials>) -> Observable<Void> {
        return loginRemoteApi.loginWith(sig: sig).do(onNext: { (session) in
            print("persist this session = \(session)")
        }).map({_ in return ()})
    }
    
}
