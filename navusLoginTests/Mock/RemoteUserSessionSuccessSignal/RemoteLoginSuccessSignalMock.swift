//
//  RemoteLoginSuccessSignalMock.swift
//  navusLoginTests
//
//  Created by Marko Dimitrijevic on 16/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift
@testable import navusLogin

class RemoteLoginSuccessSignalMock {
    func loginWith(sig: Observable<ILoginCredentials>) -> Observable<IRemoteUserSession> {
        sig.flatMap { (_) -> Observable<IRemoteUserSession> in
            return Observable.create { (observer) -> Disposable in
                observer.onNext(RemoteUserSessionMock())
                observer.onCompleted()
                return Disposables.create()
            }
        }
    }
}
