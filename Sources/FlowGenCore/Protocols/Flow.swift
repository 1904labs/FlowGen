//
//  Flow.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

internal protocol Flow: class {
    func makeViewModel() -> String
    func makeView() -> String
}
