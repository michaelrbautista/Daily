//
//  CreateAccountView.swift
//  Daily
//
//  Created by Michael Bautista on 4/13/25.
//

import SwiftUI

struct CreateAccountView: View {
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack {
            Text("Create account")
                .font(Font.FontStyles.title3)
                .foregroundStyle(Color.ColorSystem.primaryText)
                .multilineTextAlignment(.center)
            Spacer()
            VStack(spacing: 20) {
                TextField("Full name", text: $viewModel.fullName)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .textInputAutocapitalization(.never)
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
                
                TextField("Username", text: $viewModel.username)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .textInputAutocapitalization(.never)
                    .onChange(of: viewModel.username, {
                        viewModel.isValidUsername = validateUsername(viewModel.username)
                    })
                
                TextField("Age", text: $viewModel.age)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(Color.ColorSystem.primaryText)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                    .background(Color.ColorSystem.systemGray6)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .textInputAutocapitalization(.never)
                    .keyboardType(.numberPad)
                
                Picker("Gender", selection: $viewModel.gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                }
                .pickerStyle(.segmented)
            }
            Spacer()
            StyledButton(
                variant: !viewModel.isValidUsername || viewModel.username == "" || viewModel.fullName == "" || viewModel.age == "" ? .disabled : .primary,
                text: "Next",
                isLoading: $viewModel.isLoading
            ) {
                // Check if username is available
                Task {
                    let isAvailable = await viewModel.checkUsername()
                    
                    if isAvailable {
                        // Go to next screen
                        navigationController.push(.AddEmailView(viewModel: viewModel))
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        .alert(isPresented: $viewModel.returnedError, content: {
            Alert(title: Text(viewModel.errorMessage))
        })
    }
    
    func validateUsername(_ username: String) -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._]{3,15}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: username)
    }
}

#Preview {
    CreateAccountView(viewModel: OnboardingViewModel())
}
