//
//  SplashScreenView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 06/05/1447 AH.
//


//
//  SplashScreenView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        if isActive {
            JournalAppView()
        } else {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Your book image (make sure it's named "bokudo" in Assets)
                    Image("hometi")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                    
                    Text("Journali")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.white)
                    
                    Text("Your thoughts, your story")
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
            }
            .onAppear {
                // Show splash for 3 seconds then go to main app
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
