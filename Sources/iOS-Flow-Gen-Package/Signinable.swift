//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/5/20.
//
import Combine

#if os(iOS)

public protocol Signinable: class {
    var username: Published<String>
    var password: Published<String>
}

#endif
