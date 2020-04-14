//
//  ViewController.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginStackViewYConstraint: NSLayoutConstraint!
    
    // MARK:- dependencies
    var viewModel: LoginViewModel!
    var alertErrPresenter: IAlertErrorPresenter!
    var keyboardListener: IKeyboardListener!
    lazy var loginKeyboardHandler = LoginKeyboardHandler(centerYcnstr: loginStackViewYConstraint)
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidesWhenStopped = true
        bindToAndFromViewModel()
        manageKeyboardEvents()
    }
    
    private func bindToAndFromViewModel() {
        let input = LoginViewModelInputFactory.make(emailField: emailField,
                                                    passField: passField,
                                                    btn: logInBtn)
        let output = viewModel.transform(input: input)
        
        output.loginValidation
            .subscribe(onError: self.showAlert,
                       onCompleted: self.disableUI)
            .disposed(by: bag)
        
        output.loginRemote
            .subscribe(onError: alertErrPresenter.showAlert,
                       onCompleted: {self.enableUI(); self.navigateToNext()})
            .disposed(by: bag)
    }
    
    private func manageKeyboardEvents() {
        keyboardListener.getKeyboardEvents()
            .subscribe(onNext: { [weak self] (info) in
                self?.loginKeyboardHandler.handleKeyboardEvent(info: info)
                UIView.animate(withDuration: 0.5) {
                    self?.view.layoutIfNeeded()
                }
            }).disposed(by: bag)
    }
    
    private func disableUI() {
        _ = [emailField, passField, logInBtn].map {$0.isEnabled = true}
            activityIndicator.startAnimating()
    }
    
    private func enableUI() {
        _ = [emailField, passField, logInBtn].map {$0.isEnabled = false}
            activityIndicator.stopAnimating()
    }
    
    private func showAlert(error: Error) {
        enableUI()
        alertErrPresenter.showAlert(error: error)
    }
    
    private func navigateToNext() {
        let nextVC = LoginViewControllerFactory.make()// hard-coded
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
