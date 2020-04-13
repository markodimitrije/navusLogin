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
        var userCredentials: Observable<ILoginCredentials>
    }
    struct Output {
        var loginValidation: Observable<Bool>
        var loginRemote: Observable<Bool>// TODO marko: Void..
    }
}
