//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

import Foundation

enum FlowType: String {
    case signIn = "Sign In Flow"
    case signUp = "Sign Up Flow"
    
    var fileName: String {
        switch self {
        case .signIn: return "SignIn"
        case .signUp: return "SignUp"
        }
    }
    
    static var allCases: [FlowType] {
        return [.signIn, .signUp]
    }
    
    static func getFlowFromSelection(number: String) -> FlowType? {
        switch number {
        case "1": return signIn
        case "2": return signUp
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
        
        guard let selection = readLine(), let selectedFlowType = FlowType.getFlowFromSelection(number: selection) else {
            print("")
            print("")
            print("There was an error with your selecton")
            print("")
            print("")
        
            return run()
            
        }
        
        print("Generating your '\(selectedFlowType.rawValue)'")
        
        generateFlows(type: selectedFlowType)
    }

    private func printSelectionOptions() {
        var currentSelectionIndex = 1
        
        for flow in FlowType.allCases {
            print("\(currentSelectionIndex).) \(flow.rawValue)")
            currentSelectionIndex += 1
        }
    }
    
    private func generateFlows(type: FlowType) {
        guard #available(OSX 10.12, *) else { print("Unsupported OS Version"); return }
        
        let files = FlowGenFactory().makeFlow(type: type)
        
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(type.fileName + "View.swift")
            try files.0.write(toFile: url.path, atomically: true, encoding: .utf8)
        } catch {
            print(error)
            print("There was an error generating")
        }
        
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent(type.fileName + "ViewModel.swift")
            try files.1.write(toFile: url.path, atomically: true, encoding: .utf8)
        } catch {
            print(error)
            print("There was an error generating")
        }
    }
}
