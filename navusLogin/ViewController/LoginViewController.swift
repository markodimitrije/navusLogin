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
    
    var viewModel: LoginViewModel!
    var alertErrPresenter: IAlertErrorPresenter!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.hidesWhenStopped = true
        bindToAndFromViewModel()
//        self.showAlert()
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

class LoginViewModelInputFactory {
    static func make(emailField: UITextField, passField: UITextField, btn: UIButton) -> LoginViewModel.Input {
        let btnSig = btn.rx.tap.asObservable()
        let emailSig = emailField.rx.text.asObservable().map {$0 ?? ""}
        let passSig = passField.rx.text.asObservable().map {$0 ?? ""}
        let credentialsSig = Observable.combineLatest(emailSig, passSig) {
            LoginCredentials(email: $0, password: $1)
        }
        let inputSig = btnSig.withLatestFrom(credentialsSig).map {$0 as ILoginCredentials}
        return LoginViewModel.Input(userCredentials: inputSig)
    }
}
