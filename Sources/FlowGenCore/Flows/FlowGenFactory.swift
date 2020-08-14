//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

import Foundation

internal final class FlowGenFactory {
    init() {}
    
    /// Returns the view first and then the viewModel
    func makeFlow(type: FlowType) -> (String, String) {
        switch type {
        case .signIn: return ("", SignInFlow().makeViewModel())
        case .signUp: return (SignUpFlow().makeView(), SignUpFlow().makeViewModel())
        }
    }
}

