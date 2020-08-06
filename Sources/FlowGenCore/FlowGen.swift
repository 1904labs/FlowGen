//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

import Foundation

enum Flow: String {
    case signIn = "Sign In Flow"
    case signUp = "Sign Up Flow"
    
    static var allCases: [Flow] {
        return [.signIn, .signUp]
    }
    
    static func getDisplayStringFromNumber(number: String) -> String? {
        switch number {
        case "1": return signIn.rawValue
        case "2": return signUp.rawValue
        default: return nil
        }
    }
}

public final class FlowGen {
    public init() {}
    
    public func run() {
        print("==========================")
        print("== Swift Flow Generator ==")
        print("==========================")
        print("")
        print("Please enter one of the following starter flows to generate:")
        printSelectionOptions()
        
        guard let selection = readLine(), let selectionDisplayString = Flow.getDisplayStringFromNumber(number: selection) else {
            print("")
            print("")
            print("There was an error with your selecton")
            print("")
            print("")
        
            return run()
            
        }
        
        print("Generating your '\(selectionDisplayString)'")
    }

    private func printSelectionOptions() {
        var currentSelectionIndex = 1
        
        for flow in Flow.allCases {
            print("\(currentSelectionIndex).) \(flow.rawValue)")
            currentSelectionIndex += 1
        }
    }
}
