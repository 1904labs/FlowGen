//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/5/20.
//
#if os(iOS)
import Combine

public protocol Signinable: class {
    var cancellables: Set<AnyCancellable> { get }

    // Required fields
    var username: String? { get }
    var usernamePublished: Published<String?> { get }
    var usernamePublisher: Published<String?>.Publisher { get }
    
    var password: String? { get }
    var passwordPublished: Published<String?> { get }
    var passwordPublisher: Published<String?>.Publisher { get }
        
    // Validaton publishers
    var usernameIsValidPublisher: Published<Bool>.Publisher { get }
    var passwordIsValidPublisher: Published<Bool>.Publisher { get }
    var signInValidPublisher: Published<Bool>.Publisher { get }
    
    // State
    var signInIsActive: Bool { get }
    var signInIsActivePublished: Published<Bool> { get }
    var signInIsActivePublisher: Published<Bool>.Publisher { get }
    
    var isSignedIn: Bool { get }
    var isSignedInPublished: Published<Bool> { get }
    var isSignedInPublisher: Published<Bool>.Publisher { get }
}
#endif
