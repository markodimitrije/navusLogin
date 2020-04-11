//
//  ViewModelType.swift
//  navusLogin
//
//  Created by Marko Dimitrijevic on 10/04/2020.
//  Copyright © 2020 Marko Dimitrijevic. All rights reserved.
//

protocol ViewModelType {
    associatedtype Input // associatedtype XYZ -> this type has to be defined by adopter
    associatedtype Output
    
    func transform(input: Input) -> Output
}
