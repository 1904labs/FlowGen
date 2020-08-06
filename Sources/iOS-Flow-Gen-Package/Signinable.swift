//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/5/20.
//
#if os(iOS)
import Combine

public protocol Signinable: class {
    var cancellables: Set<AnyCancellable>

    // Required fields
    var username: String? { get }
    var usernamePublished: Published<String?> { get }
    var usernamePublisher: Published<String?>.Publisher { get }
    
    var password: String? { get }
    var passwordPublished: Published<String?> { get }
    var passwordPublisher: Published<String?>.Publisher { get }
        
    // Validaton publishers
    var usernameIsValidPublisher: Published<Bool>.Publisher
    var passwordIsValidPublisher: Published<Bool>.Publisher
    var signInValidPublisher: Published<Bool>.Publisher
    
    // State
    var signInIsActive: Bool { get }
    var signInIsActivePublished: Published<Bool> { get }
    var signInIsActivePublisher: Published<String?>.Publisher { get }
    
    var isSignedIn: Bool { get }
    var isSignedInPublished: Published<Bool> { get }
    var isSignedInPublisher: Published<String?>.Publisher { get }
}

extension Signinable {
    var signInValidPublisher = {
        Publishers.CombineLatest($usernameIsValidPublisher, passwordIsValidPublisher)
            .map { usernameIsValid, passwordIsValid in
                return usernameIsValid && passwordIsValid
            }
            .eraseToAnyPublisher()
    }
}
#endif
