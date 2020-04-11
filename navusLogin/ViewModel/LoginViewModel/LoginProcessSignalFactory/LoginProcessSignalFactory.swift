//
//  LoginProcessSignalFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

class LoginProcessSignalFactory {
    private let validator: ILoginValidator
    init(validator: ILoginValidator) {
        self.validator = validator
    }
    func map(userInput: UserInputProtocol) -> Observable<Void> {
        return Observable.create { (observer) -> Disposable in
            return Disposables.create {
                switch self.validator.validate(userInput: userInput) {
                    case .valid: observer.onNext(())
                    case .invalid(let error): observer.onError(error)
                }
            }
        }
    }
}
