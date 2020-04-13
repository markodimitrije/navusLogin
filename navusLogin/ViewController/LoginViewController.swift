//
//  ViewController.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, Storyboarded {

    var viewModel: ILoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showAlert()
    }
    
    private func enableUI(with enable: Bool) {
        // TODO show/hide, alpha ...
    }
    
    private func showAlert() {
        let alertVC = ErrorAlertControllerFactory.make(error: LoginError.unknownUser)
        UIViewController.topViewController().present(alertVC, animated: true)
    }

}
