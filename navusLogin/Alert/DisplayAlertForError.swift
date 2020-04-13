//
//  DisplayAlertForError.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

class DisplayAlertForError: IDisplayAlertForError {
    func displayAlert(for error: Error) {
        let alertVC = ErrorAlertControllerFactory.make(error: error)
        UIViewController.topViewController().navigationController?
            .pushViewController(alertVC, animated: true)
    }
}
