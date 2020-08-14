//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/14/20.
//
#if os(iOS)
import Combine

public protocol Signupable: class {
    var cancellables: Set<AnyCancellable> { get }

    // Required values
    var username: String?
    var usernamePublished: Published<String?>
    var usernamePublisher: Published<String?>.Publisher
    
    var password: String?
    var passwordPublished: Published<String?>
    var passwordPublisher: Published<String?>.Publisher
    
    var confirmPassword: String?
    var confirmPasswordPublished: Published<String?>
    var confirmPasswordPublisher: Published<String?>.Publisher
    
    var email: String?
    var emailPublished: Published<String?>
    var emailPublisher: Published<String?>.Publisher
    
    var signUpError: Error? { get }
    var signUpErrorPublished: Published<Error?> { get }
    var signUpErrorPublisher: Published<Error?>.Publisher { get }
    
    // Validaton publishers
    var usernameIsValidPublisher: AnyPublisher<Bool, Never> { get }
    var passwordIsValidPublisher: AnyPublisher<Bool, Never> { get }
    var emailIsValidPublisher: AnyPublisher<Bool, Never> { get }
    var signUpValidPublisher: AnyPublisher<Bool, Never> { get }
    
    // State
    var signUpIsActive: Bool { get }
    var signUpIsActivePublished: Published<Bool> { get }
    var signUpIsActivePublisher: Published<Bool>.Publisher { get }
    
    var isSignedUp: Bool { get }
    var isSignedUpPublished: Published<Bool> { get }
    var isSignedInPublisher: Published<Bool>.Publisher { get }
    
    var isSigningUp: Bool { get }
    var isSigningUpPublished: Published<Bool> { get }
    var isSigningUpPublisher: Published<Bool>.Publisher { get }
    
    // Actions
    func signUp()
}
#endif

