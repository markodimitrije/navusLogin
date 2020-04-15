//
//  LoginRemoteApiSuccessMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift
@testable import navusLogin

class LoginRemoteApiSuccessMock: ILoginRemoteApi {
    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        return Observable.create { (observer) -> Disposable in
            observer.onCompleted()
            return Disposables.create()
        }.subscribeOn(MainScheduler.instance)
    }
}
