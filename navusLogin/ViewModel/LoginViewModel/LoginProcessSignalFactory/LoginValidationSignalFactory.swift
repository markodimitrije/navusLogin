//
//  LoginValidationSignalFactory.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 11/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

class LoginValidationSignalFactory {
    
    private let validator: ILoginValidator
    init(validator: ILoginValidator) {
        self.validator = validator
    }
    
    func map(userInput: ILoginCredentials) -> Observable<Void> {
        return Observable.create { (observer) -> Disposable in
            switch self.validator.validate(userInput: userInput) {
                case .valid:
                    observer.onNext(())
                    observer.onCompleted()
                case .invalid(let error):
                    observer.onError(error)
            }
            return Disposables.create()
        }.subscribeOn(MainScheduler.instance)
    }
    
}
