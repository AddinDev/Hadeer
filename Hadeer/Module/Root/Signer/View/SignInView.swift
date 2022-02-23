//
//  SignInView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct SignInView: View {
  var body: some View {
    content
  }
}

extension SignInView {
  
  private var content: some View {
    VStack {
      VStack {
        Text("Login")
          .font(.title)
          .bold()
          .padding(.vertical, 5)
        Text("Please fill the form below to continue")
          .foregroundColor(Color(.systemGray))
      }
      .padding(.vertical)
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
      HStack {
        Text("Already have an account?")
        Button(action: {
          
        }) {
          Text("Register")
            .foregroundColor(.blue)
        }
      }
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
