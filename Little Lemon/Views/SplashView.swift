//
//  SplashView.swift
//  Little Lemon
//
//  Created by Alexey Rasskazov on 05/10/2024.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @Environment(\.presentationMode) var presentation
    let persistenceController = PersistenceController.shared
    
    @State var isActive:Bool = false
    
    var isLoggedIn: Bool {
        get {
            UserDefaults.standard.value(forKey: lemonLoggedIn) as? Bool ?? false
        }
    }
    
    var body: some View {
        VStack {
            if self.isActive {isLoggedIn ?
                AnyView(HomeView().environment(\.managedObjectContext, persistenceController.container.viewContext)) :
                AnyView(OnboardingView())
            } else {
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0)
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
