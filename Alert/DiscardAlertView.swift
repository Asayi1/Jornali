//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*

import SwiftUI

struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Are you sure you want to discard changes on this journal?")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top, 8)
                
                Button(action: { 
                    viewModel.discardChanges()
                    dismiss()
                }) {
                    Text("Discard Changes")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.red)
                        .cornerRadius(12)
                }
                
                Button(action: { viewModel.showDiscardAlert = false }) {
                    Text("Keep Editing")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                        .cornerRadius(12)
                }
            }
            .padding(24)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(20)
            .padding(.horizontal, 40)
        }
    }
}

*/


//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/* glass code
import SwiftUI

struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.clear
            .alert("Discard Changes?", isPresented: $viewModel.showDiscardAlert) {
                Button("Keep Editing", role: .cancel) { }
                Button("Discard", role: .destructive) {
                    viewModel.discardChanges()
                    dismiss()
                }
            } message: {
                Text("Are you sure you want to discard changes on this journal?")
            }
    }
}
*/

//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
//
//  DiscardAlertView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
import SwiftUI

struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.clear
            .alert("Discard Changes?", isPresented: $viewModel.showDiscardAlert) {
                Button("Keep Editing", role: .cancel) { }
                Button("Discard", role: .destructive) {
                    viewModel.discardChanges()
                    dismiss()
                }
            } message: {
                Text("Are you sure you want to discard changes on this journal?")
            }
    }
}
*/

import SwiftUI

struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.clear
            .alert("Discard Changes?", isPresented: $viewModel.showDiscardAlert) {
                Button("Keep Editing", role: .cancel) { }
                Button("Discard", role: .destructive) {
                    viewModel.discardChanges()
                    dismiss()
                }
            } message: {
                Text("Are you sure you want to discard changes on this journal?")
            }
    }
}
