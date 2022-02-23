//
//  SignInView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct SignInView: View {
  @State private var selection: String?
  var body: some View {
    ZStack {
      NavigationLink(destination: SignUpView(), tag: "Register", selection: $selection) { EmptyView() }
      background
      content
        .background(
          Color.white
            .cornerRadius(10)
        )
        .padding(20)
    }
  }
}

extension SignInView {
  
  private var background: some View {
    Image("SignerBackground")
      .resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
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
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          Text("Username")
          TextField("Username", text: .constant(""))
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
        VStack(alignment: .leading, spacing: 5) {
          Text("Password")
          TextField("Password", text: .constant(""))
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
        HStack {
          spacer
          Button(action: {
            
          }) {
            Text("Forgot Password?")
              .foregroundColor(.blue)
          }
        }
      }
      .padding(.vertical, 10)
      Button(action: {
        
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
      HStack {
        Text("Don't have an account?")
        Button(action: {
          self.selection = "Register"
        }) {
          Text("Register")
            .foregroundColor(.blue)
        }
      }
      .padding(.vertical, 8)
    }
    .font(.custom("Poppins", size: 16))
    .padding()
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
