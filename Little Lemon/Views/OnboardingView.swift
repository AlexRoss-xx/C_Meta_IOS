//
//  OnboardingView.swift
//  Little Lemon
//
//  Created by Alexey Rasskazov on 05/10/2024.
//


import SwiftUI
import CoreData

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentation
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isActive: Bool = false
    
    @State private var isValidEmail = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack { 
                    Spacer()
                    LittleLemonLogo()
                    Spacer()
                }
                .frame(height: 40)
                .padding(.bottom, 10)
                
                heroView
                    .padding()
                onboardingForm
                VStack(alignment: .center) {
                    NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true),
                                   isActive: $isActive) {
                        EmptyView()
                    }
                    registerButton
                }
                .padding()
                 
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        
    }
    
    private var registerButton: some View {
        Button(action: {
            UserDefaults.standard.set(firstName, forKey: lemonFirstName)
            UserDefaults.standard.set(lastName, forKey: lemonLastName)
            UserDefaults.standard.set(email, forKey: lemonEmail)
            UserDefaults.standard.setValue(true, forKey: lemonLoggedIn)
            isActive.toggle()
        }) {
            Text("Register")
                .fontWeight(.bold)
                .frame(width: 250, height: 44)
                .background(lemonColor)
                .foregroundColor( (firstName.isEmpty || lastName.isEmpty || email.isEmpty || self.isNotValidEmail(email)) ? .gray : .white)
                .cornerRadius(12)
                
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
        .disabled(firstName.isEmpty || lastName.isEmpty || email.isEmpty || self.isNotValidEmail(email))
    }
    
    private func isNotValidEmail(_ email:String?)-> Bool {
        if email == nil{
            return true
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let v=emailPred.evaluate(with: email)
        return !v
      }
    
    
    private var heroView: some View {
        VStack(alignment:.leading) {
            Text("Little Lemon")
                .font(.system(size: 44.0))
                .bold()
                .foregroundColor(lemonColor)
           
            HStack {
                VStack(alignment:.leading) {
                    Text("Chicago")
                        .font(.system(size: 26.0))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.bottom,20)
                    Text("We are a family owned\nMediterranean restaurant,\nfocused on traditional\nrecipes served with a\nmodern twist.")
                        .font(.system(size: 14.0))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Spacer()
                Image("heroMainDish")
                    .resizable()
                    .scaledToFit()
                    .frame(width:150.0, height:150.0)
                    .cornerRadius(10.0)
            }.background(greenColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .foregroundColor(.secondary)
                .background(greenColor)
                .cornerRadius(6.0)
        }
        .padding()
        .background(greenColor)
    }
    
    private var onboardingForm: some View {
        VStack(alignment: .leading) {
            Text("First Name *") .foregroundColor(.secondary)
            
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Last name *").foregroundColor(.secondary)
            TextField("Last name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text("Email *").foregroundColor(.secondary)
            TextField("", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .border(!email.isEmpty && self.isNotValidEmail(email) ? Color.red : Color.gray)
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
        .background(whiteColor)
    }
    
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().environmentObject(Model())
    }
}

