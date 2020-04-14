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
        let loginRemoteSignal = input.userCredentials.flatMap(remoteSignalFactory.map(userInput:))
  
        return Output(loginValidation: loginValidationSignal, loginRemote: loginRemoteSignal)
    }
    
}

class LoginRemoteApiFactory {
    static func make() -> ILoginRemoteApi {
        LoginRemoteApi(apiController: true) // TODO: marko
    }
}
