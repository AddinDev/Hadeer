//
//  SignUpView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct SignUpView: View {
  @Environment(\.presentationMode) var presentationMode
  var body: some View {
    ZStack {
      background
      content
        .background(
          Color.white
            .cornerRadius(10)
        )
        .padding(20)
    }
    .navigationTitle("")
    .navigationBarHidden(true)
  }
}

extension SignUpView {
  
  private var background: some View {
    Image("SignerBackground")
      .resizable()
      .scaledToFill()
      .edgesIgnoringSafeArea(.all)
  }
  
  private var content: some View {
    VStack {
      VStack(spacing: 3) {
        Text("Register")
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
        VStack(alignment: .leading, spacing: 5) {
          Text("Password")
          TextField("Password", text: .constant(""))
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
      }
      .padding(.vertical, 10)
      Button(action: {
        
      }) {
        HStack {
          Text("Register")
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
        Text("Already have an account?")
        Button(action: {
          self.presentationMode.wrappedValue.dismiss()
        }) {
          Text("Login")
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
