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
    init(validator: ILoginValidator) {
        self.validator = validator
    }
    
    func transform(input: Input) -> Output {
        let loginProcessSignalFactory = LoginProcessSignalFactory(validator: self.validator)
        let userInputValidationSignal = input.userCredentials.flatMap(loginProcessSignalFactory.map(userInput:))
  
        let loginProcess = userInputValidationSignal
        //let loginProcess = Observable.merge([userInputValidationSignal, loginApiSignal])
        
        return Output(processLogin: loginProcess)
    }
    
}
