//
//  LoginViewModel.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

class LoginViewModel: ILoginViewModel {
    
    private let validator: ILoginValidator
    private let loginRemoteApi: ILoginRemoteApi
    
    init(validator: ILoginValidator, loginRemoteApi: ILoginRemoteApi) {
        self.validator = validator
        self.loginRemoteApi = loginRemoteApi
    }
    
    func transform(input: Input) -> Output {
          
        let validationSignalFactory = LoginValidationSignalFactory(validator: self.validator)
        let loginValidationSignal = input.userCredentials.flatMap(validationSignalFactory.map(userInput:))
        
        let remoteSignalFactory = LoginRemoteSignalFactory(loginRemoteApi: self.loginRemoteApi)
        
        let trigger = Observable.just(true).withLatestFrom(input.userCredentials)
        let loginRemoteSignal = remoteSignalFactory.createWith(sig: trigger)
        
        let loginSignal = loginValidationSignal.concat(loginRemoteSignal)
        
        return Output(loginSignal: loginSignal)
    }
    
}

class LoginRemoteApiFactory {
    static func make() -> ILoginRemoteApi {
        LoginRemoteApi(apiController: true) // TODO: marko
    }
}
