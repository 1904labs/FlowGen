//
//  File.swift
//  
//
//  Created by Connor Besancenez on 8/14/20.
//

internal final class SignUpFlow: Flow {
    init() {}
    
    func makeViewModel() -> String{
        let viewModelString = """
        import Foundation
        import Combine

        private class SignUpViewModel: ObservableObject, Signupable {
            var cancellables = Set<AnyCancellable>()

            // MARK: - Values
            @Published var username: String?
            var usernamePublished: Published<String?> { _username }
            var usernamePublisher: Published<String?>.Publisher { $username }
            
            @Published var password: String?
            var passwordPublished: Published<String?> { _password }
            var passwordPublisher: Published<String?>.Publisher { $password }
            
            @Published var confirmPassword: String?
            var confirmPasswordPublished: Published<String?> { _confirmPassword }
            var confirmPasswordPublisher: Published<String?>.Publisher { $confirmPassword }
            
            @Published var email: String?
            var emailPublished: Published<String?> { _email }
            var emailPublisher: Published<String?>.Publisher { $email }
            
            @Published var signUpError: Error?
            var signUpErrorPublished: Published<Error?> { _signUpError }
            var signUpErrorPublisher: Published<Error?>.Publisher { $signUpError }
            
            // MARK: - State
            @Published var signUpIsActive: Bool = false
            var signUpIsActivePublished: Published<Bool> { _signUpIsActive }
            var signUpIsActivePublisher: Published<Bool>.Publisher { $signUpIsActive }
            
            @Published var isSignedIn: Bool = false
            var isSignedInPublished: Published<Bool> { _isSignedIn }
            var isSignedInPublisher: Published<Bool>.Publisher { $isSignedIn }
            
            @Published var isSigningUp: Bool = false
            var isSigningUpPublished: Published<Bool> { _isSigningUp }
            var isSigningUpPublisher: Published<Bool>.Publisher { $isSigningUp }
            
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
                Publishers.CombineLatest($password, $confirmPassword)
                    .map { password, confirmPassword in
                        guard let password = password, let confirmPassword = confirmPassword else { return false }
                        return (password == confirmPassword) && (!password.isEmpty && !confirmPassword.isEmpty)
                    }
                    .eraseToAnyPublisher()
            }
            
            var emailIsValidPublisher: AnyPublisher<Bool, Never> {
                $email
                    .map {
                        guard let email = $0 else { return false }
                        return !email.isEmpty
                    }
                    .eraseToAnyPublisher()
            }
            
            var signUpValidPublisher: AnyPublisher<Bool, Never> {
                Publishers.CombineLatest(usernameIsValidPublisher, passwordIsValidPublisher, emailIsValidPublisher)
                    .map {
                        $0 && $1
                    }
                    .eraseToAnyPublisher()
            }
            
            init() {
                signUpValidPublisher
                    .receive(on: DispatchQueue.main)
                    .assign(to: \\.signUpIsActive, on: self)
                    .store(in: &cancellables)
            }
            
            /* When signUpg in do the following:
            1.) Set isSigningUp to true in order to show some sort of loading indicator
            2.) Upon success set isSignedIn to true in order to drive the navigation of your app
            3.) Upon failure set the signUpError to some Error in order to display an error
            4.) At the end set the isSigningUp back to false to remove spinner
            */
            func signUp() {
                
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
                    TextField("Email", text: self.$viewModel.email)
                    TextField("Password", text: self.$viewModel.password)
                    TextField("Confirm Password", text: self.$viewModel.confirmPassword)
                    
                    Button(action: {
                        self.viewModel.signUp()
                    }) { _ in
                        Text("Sign Up")
                    }
                    .disabled(!self.$viewModel.signUpIsActive)
                }
            }
        }
        """
    }
}


