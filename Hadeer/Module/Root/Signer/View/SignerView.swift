//
//  SignerView.swift
//  Hadeer
//
//  Created by Addin Satria on 23/02/22.
//

import SwiftUI

struct SignerView: View {
  @State private var isRegister = false
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
  
  private var content: some View {
    VStack {
      VStack(spacing: 3) {
        Text(isRegister ? "Register" : "Login")
          .font(.title)
          .bold()
        Text("Please fill the form below to continue")
          .foregroundColor(Color(.systemGray))
      }
      .padding(.vertical, 30)
      VStack {
        VStack(alignment: .leading, spacing: 5) {
          Text("Email")
          TextField("Email", text: .constant(""))
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
        if isRegister {
        VStack(alignment: .leading, spacing: 5) {
          Text("Full Name")
          TextField("Full Name", text: .constant(""))
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
        VStack(alignment: .leading, spacing: 5) {
          Text("Username")
          TextField("Username", text: .constant(""))
            .padding()
            .background(
              Color(.systemGray6)
                .cornerRadius(10)
            )
        }
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
          Text(isRegister ? "Register" : "Login")
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
        Text(isRegister ? "Already have an account?" : "Don't have an account?")
        Button(action: {
          self.isRegister.toggle()
        }) {
          Text(isRegister ? "Login" : "Register")
            .foregroundColor(.blue)
        }
      }
      .padding(.vertical, 8)
    }
    .padding()
    .font(.custom("Poppins", size: 16))
  }
  
  private var spacer: some View {
    Spacer()
  }
  
}

struct SignerView_Previews: PreviewProvider {
    static var previews: some View {
        SignerView()
    }
}
