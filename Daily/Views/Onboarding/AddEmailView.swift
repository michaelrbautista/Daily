//
//  AddEmailView.swift
//  Daily
//
//  Created by Michael Bautista on 4/9/25.
//

import SwiftUI

struct AddEmailView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    @State var isLoading = false
    
    var body: some View {
        VStack {
            Text("Add email")
                .font(Font.FontStyles.title3)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 10) {
                TextField("Email", text: $viewModel.email)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.email, {
                        viewModel.isValidEmail = validateEmail(viewModel.email)
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
            Spacer()
            StyledButton(
                variant: !viewModel.isValidEmail ? .disabled : .primary,
                text: "Next",
                isLoading: $isLoading
            ) {
                // Send and get one time code
                Task {
                    do {
                        isLoading = true
                        
                        // Send OTP
                        try await SupabaseService.shared.supabase.auth.signInWithOTP(email: viewModel.email, shouldCreateUser: true)
                        
                        // Go to next page
                        navigationController.push(.OneTimeCodeView(viewModel: viewModel, isSignIn: false))
                        
                        isLoading = false
                    } catch {
                        isLoading = false
                        if error.localizedDescription.contains("For security purposes, you can only request this after") {
                            navigationController.push(.OneTimeCodeView(viewModel: viewModel, isSignIn: false))
                        } else {
                            viewModel.errorMessage = error.localizedDescription
                            viewModel.returnedError = true
                        }
                        print(error)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .alert(isPresented: $viewModel.returnedError, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}

#Preview {
    AddEmailView(viewModel: OnboardingViewModel())
}
