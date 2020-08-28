//
//  SignInViewModel.swift
//  
//
//  Created by Connor Besancenez on 8/6/20.
//

internal final class SignInFlow: Flow {
    init() {}
    
    func makeViewModel() -> String{
        let viewModelString = """
        import Foundation
        import Combine

        private class SignInViewModel: ObservableObject, Signinable {
            var cancellables = Set<AnyCancellable>()

            // MARK: - Values
            @Published var username: String?
            var usernamePublished: Published<String?> { _username }
            var usernamePublisher: Published<String?>.Publisher { $username }
            
            @Published var password: String?
            var passwordPublished: Published<String?> { _password }
            var passwordPublisher: Published<String?>.Publisher { $password }
            
            @Published var signInError: Error?
            var signInErrorPublished: Published<Error?> { _signInError }
            var signInErrorPublisher: Published<Error?>.Publisher { $signInError }
            
            // MARK: - State
            @Published var signInIsActive: Bool = false
            var signInIsActivePublished: Published<Bool> { _signInIsActive }
            var signInIsActivePublisher: Published<Bool>.Publisher { $signInIsActive }
            
            @Published var isSignedIn: Bool = false
            var isSignedInPublished: Published<Bool> { _isSignedIn }
            var isSignedInPublisher: Published<Bool>.Publisher { $isSignedIn }
            
            @Published var isSigningIn: Bool = false
            var isSigningInPublished: Published<Bool> { _isSigningIn }
            var isSigningInPublisher: Published<Bool>.Publisher { $isSigningIn }
            
            // MARK: - Publishers
            var usernameIsValidPublisher: AnyPublisher<Bool, Never> {
                $username
                    .map {
                        guard let username = $0 else { return false }
                        return !username.isEmpty
                    }
                    .eraseToAnyPublisher()
            }

            var passwordIsValidPublisher: AnyPublisher<Bool, Never> {
                $password
                    .map {
                        guard let password = $0 else { return false }
                        return !password.isEmpty
                    }
                    .eraseToAnyPublisher()
            }
            
            var signInValidPublisher: AnyPublisher<Bool, Never> {
                Publishers.CombineLatest(usernameIsValidPublisher, passwordIsValidPublisher)
                    .map {
                        $0 && $1
                    }
                    .eraseToAnyPublisher()
            }
            
            init() {
                signInValidPublisher
                    .receive(on: DispatchQueue.main)
                    .assign(to: \\.signInIsActive, on: self)
                    .store(in: &cancellables)
            }
            
            /* When signing in do the following:
            1.) Set isSigningIn to true in order to show some sort of loading indicator
            2.) Upon success set isSignedIn to true in order to drive the navigation of your app
            3.) Upon failure set the signInError to some Error in order to display an error
            4.) At the end set the isSigningIn back to false to remove spinner
            */
            func signIn() {
                
            }

            deinit {
                cancellables.forEach { $0.cancel() }
            }
        }
        """
        
        return viewModelString
    }
    
    func makeView() -> String {
        return """
        import SwiftUI

        struct SignUpView: View {
            @ObservedObject var viewModel: SignUpViewModel
            
            var body: some View {
                VStack {
                    TextField("Username", text: self.$viewModel.username)
                    TextField("Password", text: self.$viewModel.password)
                    
                    Button(action: {
                        self.viewModel.signIn()
                    }) { _ in
                        Text("Sign In")
                    }
                    .disabled(!self.$viewModel.signInIsActive)
                }
            }
        }
        """
    }
}


