//
//  SignerView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct SignerView: View {
  //  @State private var route: String?
  @EnvironmentObject var auth: Authentication
  @ObservedObject var presenter: SignerPresenter
  
  @State private var username = ""
  @State private var password = ""
  
  var body: some View {
    ZStack {
      background
      content
        .background(
          Color.white
            .cornerRadius(10)
        )
        .padding(20)
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1))
      if presenter.isLoading {
        ZStack {
        Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
        ProgressView()
          .progressViewStyle(CircularProgressViewStyle())
        }
      }
    }
    .navigationTitle("")
    .navigationBarHidden(true)
  }
}

extension SignerView {
  
  private var background: some View {
    Image("SignerBackground")
      .resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
  }
  
  private var errorIndicator: some View {
    VStack {
      Text(presenter.errorMessage)
    }
    .foregroundColor(.red)
    .padding(.vertical, 8)
  }
  
  private var content: some View {
    VStack {
      VStack(spacing: 3) {
        Text("Login")
          .font(.title)
          .bold()
        Text("Please fill the form below to continue")
          .foregroundColor(Color(.systemGray))
      }
      .padding(.vertical, 30)
      VStack(alignment: .leading, spacing: 5) {
        Text("Username")
        TextField("Username", text: $username)
          .autocapitalization(.none)
          .disableAutocorrection(true)
          .padding()
          .background(
            Color(.systemGray6)
              .cornerRadius(10)
          )
        VStack(alignment: .leading, spacing: 5) {
          Text("Password")
          SecureField("Password", text: $password)
            .textInputAutocapitalization(.none)
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
      }
      .padding(.vertical, 10)
      Button(action: {
          presenter.signIn(username, password) { user in
            auth.signIn()
            auth.change(UserMapper.domainToAuth(user))
          }
      }) {
        HStack {
          Text("Login")
            .foregroundColor(.white)
            .font(.title2)
            .bold()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(
          Color.blue
            .cornerRadius(10)
        )
      }
      .padding(.vertical, 8)
      if presenter.isError {
        errorIndicator
      }
    }
    .padding()
    .font(.custom("Poppins", size: 16))
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

// private struct SignerView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignerView()
//    }
// }
