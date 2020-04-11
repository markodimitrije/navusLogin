//
//  Storyboarded.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import UIKit

protocol Storyboarded: class {
    static func instantiate(using sb: UIStoryboard?) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(using sb: UIStoryboard? = nil) -> Self {
        let sb = sb ?? UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let name = String(describing: self)
        return sb.instantiateViewController(withIdentifier: name) as! Self
    }
}
