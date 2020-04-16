//
//  LoginWorkerError.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 16/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift
@testable import navusLogin
class LoginWorkerError: ILoginWorker {
    
    var sessionIsReceived = false
    
    func loginWith(input sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        sig.flatMap { (_) -> Observable<IRemoteUserSession> in
            return Observable.create { (observer) -> Disposable in
                observer.onError(LoginError.unauthorized)
                return Disposables.create()
            }
        }
    }
    
    func received(userSession: IRemoteUserSession) {
        sessionIsReceived = true
    }
    
}

