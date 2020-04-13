//
//  GlobalFuncs.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 13/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

import Foundation

func +=<Key, Value> (lhs: inout [Key: Value], rhs: [Key: Value]) {
    rhs.forEach{ lhs[$0] = $1 }
}
