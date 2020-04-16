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
        let validatedInputSignal = validationSignalFactory.filterInput(userInput: input.userCredentials)
        
        let remoteSignalFactory = LoginRemoteSignalFactory(loginRemoteApi: self.loginRemoteApi)

        let loginRemoteSignal = remoteSignalFactory.createWith(sig: validatedInputSignal)//input.userCredentials)
        
        return Output(loginSignal: loginRemoteSignal)
    }
    
}

class LoginRemoteApiFactory {
    static func make() -> ILoginRemoteApi {
        LoginRemoteApi(apiController: true) // TODO: marko
    }
}
