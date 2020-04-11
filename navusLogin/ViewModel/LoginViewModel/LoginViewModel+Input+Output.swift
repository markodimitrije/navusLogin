//
//  LoginViewModel+Input+Output.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import RxSwift

extension LoginViewModel: ViewModelType {
    struct Input {
        var userCredentials: Observable<UserInputProtocol>
    }
    struct Output {
        var processLogin: Observable<Bool>
    }
}
