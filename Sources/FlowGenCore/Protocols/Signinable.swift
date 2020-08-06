//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//
#if os(iOS)
import Combine

public protocol Signinable: class {
    var cancellables: Set<AnyCancellable> { get }

    // Required values
    var username: String? { get }
    var usernamePublished: Published<String?> { get }
    var usernamePublisher: Published<String?>.Publisher { get }
    
    var password: String? { get }
    var passwordPublished: Published<String?> { get }
    var passwordPublisher: Published<String?>.Publisher { get }
    
    var signInError: Error? { get }
    var signInErrorPublished: Published<Error?> { get }
    var signInErrorPublisher: Published<Error?>.Publisher { get }
        
    // Validaton publishers
    var usernameIsValidPublisher: AnyPublisher<Bool, Never> { get }
    var passwordIsValidPublisher: AnyPublisher<Bool, Never> { get }
    var signInValidPublisher: AnyPublisher<Bool, Never> { get }
    
    // State
    var signInIsActive: Bool { get }
    var signInIsActivePublished: Published<Bool> { get }
    var signInIsActivePublisher: Published<Bool>.Publisher { get }
    
    var isSignedIn: Bool { get }
    var isSignedInPublished: Published<Bool> { get }
    var isSignedInPublisher: Published<Bool>.Publisher { get }
    
    var isSigningIn: Bool { get }
    var isSigningInPublished: Published<Bool> { get }
    var isSigningInPublisher: Published<Bool>.Publisher { get }
    
    // Actions
    func signIn()
}
#endif
