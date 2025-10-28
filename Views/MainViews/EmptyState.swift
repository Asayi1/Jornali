//
//  JournalAppView 2.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

//
//  JournalAppView 2.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

//
//  EmptyState.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
//
//  JournalAppView 2.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

import SwiftUI

struct JournalAppView: View {
    
    
    
    
    
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.journals.isEmpty {
                EmptyStateView(viewModel: viewModel)
            } else {
                MainPageView(viewModel: viewModel)
            }
            
            // Delete Alert
            if viewModel.showDeleteAlert {
                DeleteAlertView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $viewModel.isEditing) {
            EditorView(viewModel: viewModel)
            .presentationBackground(Color.clear)       }
    }
}

#Preview {
    JournalAppView()
}
