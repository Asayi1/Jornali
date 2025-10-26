//
//  EditorView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//


//
//  EditorView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

import SwiftUI

struct EditorView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.11, blue: 0.12)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Custom Header
                HStack {
                    Button(action: {
                        if !viewModel.currentTitle.isEmpty || !viewModel.currentContent.isEmpty {
                            viewModel.showDiscardAlert = true
                        } else {
                            dismiss()
                            viewModel.isEditing = false
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 36, height: 36)
                            .background(
                                ZStack {
                                    Circle()
                                        .fill(Color.white.opacity(0.08))
                                    Circle()
                                        .fill(
                                            LinearGradient(
                                                colors: [Color.white.opacity(0.12), Color.white.opacity(0.05)],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            )
                                        )
                                    Circle()
                                        .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
                                }
                            )
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        viewModel.saveJournal()
                        dismiss()
                    }) {
                        Image(systemName: "checkmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 36, height: 36)
                            .background(Color(red: 0.4, green: 0.47, blue: 1.0))
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
                Divider()
                    .background(Color.white.opacity(0.1))
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        // Title Input
                        TextField("Title", text: $viewModel.currentTitle)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        
                        Text(Date().formatted(date: .numeric, time: .omitted))
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16)
                        
                        // Content Input
                        ZStack(alignment: .topLeading) {
                            if viewModel.currentContent.isEmpty {
                                Text("Type your Journal...")
                                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 25)
                                    .padding(.top, 8)
                            }
                            
                            TextEditor(text: $viewModel.currentContent)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                                .padding(.horizontal, 20)
                                .frame(minHeight: 400)
                        }
                    }
                }
            }
            
            // Discard Alert Overlay
            if viewModel.showDiscardAlert {
                DiscardAlertView(viewModel: viewModel)
            }
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.hidden)
        .presentationCornerRadius(28)
        .interactiveDismissDisabled()
    }
}
