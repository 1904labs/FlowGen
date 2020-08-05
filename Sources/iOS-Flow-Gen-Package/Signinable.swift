//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/5/20.
//
#if os(iOS)
import Combine

public protocol Signinable: class {
    var username: String? { get }
    var usernamePublished: Published<String?> { get }
    var usernamePublisher: Published<String?>.Publisher { get }
    
    var password: String? { get }
    var passwordPublished: Published<String?> { get }
    var passwordPublisher: Published<String?>.Publisher { get }
}
#endif
