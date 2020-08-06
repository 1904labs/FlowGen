//
//  Flow.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

protocol Flow: class {
    func makeViewModel() -> String
    func makeView() -> String
}
