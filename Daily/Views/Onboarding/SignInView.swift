//
//  SignInView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI
import Supabase

struct SignInView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel = OnboardingViewModel()
    
    @State var isValidEmail = false
    
    @State var isLoading = false
    
    @State var returnedError = false
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            Text("Sign in")
                .font(Font.FontStyles.title3)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 10) {
                HStack {
                    TextField("Email", text: $viewModel.email)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.ColorSystem.primaryText)
                        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        .textInputAutocapitalization(.never)
                        .onChange(of: viewModel.email, {
                            isValidEmail = validateEmail(viewModel.email)
                        })
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                HStack {
                                    Spacer()
                                    Button("Done") {
                                        hideKeyboard()
                                    }
                                }
                            }
                        }
                }
                .background(Color.ColorSystem.systemGray6)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            Spacer()
            StyledButton(
                variant: !isValidEmail ? .disabled : .primary,
                text: "Next",
                isLoading: $isLoading
            ) {
                // Send and get one time code
                Task {
                    do {
                        isLoading = true
                        
                        try await SupabaseService.shared.supabase.auth.signInWithOTP(email: viewModel.email, shouldCreateUser: false)
                        
                        // Go to next page
                        navigationController.push(.OneTimeCodeView(viewModel: viewModel, isSignIn: true))
                        
                        isLoading = false
                    } catch {
                        isLoading = false
                        if error.localizedDescription == "Signups not allowed for otp" {
                            errorMessage = "You must create an account before signing in."
                            returnedError = true
                        } else if error.localizedDescription.contains("For security purposes, you can only request this after") {
                            navigationController.push(.OneTimeCodeView(viewModel: viewModel, isSignIn: false))
                        } else {
                            errorMessage = error.localizedDescription
                            returnedError = true
                        }
                        print(error)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .alert(isPresented: $returnedError, content: {
            Alert(title: Text(errorMessage))
        })
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

#Preview {
    SignInView()
}
