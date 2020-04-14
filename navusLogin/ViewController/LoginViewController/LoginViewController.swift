//
//  LoginViewController.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 14/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passTxtField: UITextField!
    @IBOutlet weak var logBtn: UIButton!
    @IBOutlet weak var activeIndicator: UIActivityIndicatorView!
    @IBOutlet weak var logStackViewYConstraint: NSLayoutConstraint!
    
    // MARK:- dependencies
    var viewModel: LoginViewModel!
    var alertErrPresenter: IAlertErrorPresenter!
    var keyboardListener: IKeyboardListener!
    lazy var loginKeyboardHandler = LoginKeyboardHandler(centerYcnstr: logStackViewYConstraint)
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activeIndicator.hidesWhenStopped = true
        bindToAndFromViewModel()
        manageKeyboardEvents()
    }
    
    private func bindToAndFromViewModel() {
        let input = LoginViewModelInputFactory.make(emailField: emailTxtField,
                                                    passField: passTxtField,
                                                    btn: logBtn)
        
        let output = viewModel.transform(input: input)
        
        output.loginValidation
            .subscribe(onError: self.errorCatched,
                       onCompleted: self.disableUI)
            .disposed(by: bag)
        
        output.loginRemote
            .subscribe(onError: self.errorCatched,
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
        _ = [emailTxtField, passTxtField, logBtn].map {$0.isEnabled = false}
            activeIndicator.startAnimating()
    }
    
    private func enableUI() {
        _ = [emailTxtField, passTxtField, logBtn].map {$0.isEnabled = true}
            activeIndicator.stopAnimating()
    }
    
    private func errorCatched(error: Error) {
        bindToAndFromViewModel()
        enableUI()
        alertErrPresenter.showAlert(error: error)
    }
    
    private func navigateToNext() {
        let nextVC = LoginViewControllerFactory.make()// hard-coded
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
