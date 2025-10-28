//
//  EmptyStateView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

//
//  EmptyStateView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

/*
import SwiftUI

struct EmptyStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack {VStack(spacing: 20) {
            // ✅ الصورة فوق النصوص
            Image("journal_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .shadow(radius: 5)
            
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: {
                            viewModel.filterType = .date
                        }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button(action: {
                            viewModel.filterType = .bookmarked
                        }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            Spacer()
            
            VStack(spacing: 20) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(colors: [Color.blue.opacity(0.6), Color.blue.opacity(0.8)], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(12))
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 100, height: 100)
                        .shadow(radius: 10)
                }
                
                Text("Begin Your Journal")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Craft your personal diary, tap the\nplus icon to begin")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
        }
        }
    }
}
*/
//
//  MainPageView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
import SwiftUI

struct MainPageView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with Filter Menu
//
//            Image("Bokudo")       // استخدم اسم الصورة اللي حطيتها في Assets
//                .resizable()           // لتغيير حجم الصورة
//                .scaledToFit()         // للحفاظ على نسبة العرض إلى الارتفاع
//                .frame(width: 80, height: 80) // تحديد الحجم
//                .shadow(radius: 5)     // اختيارياً لإضافة ظل
//
//
            
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
               
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: {
                            viewModel.filterType = .date
                        }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button(action: {
                            viewModel.filterType = .bookmarked
                        }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            .padding(.bottom, 20)
            
            // Journal List
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredJournals) { journal in
                        JournalCardView(journal: journal, viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
            
            Spacer()
        }
        .overlay(
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
                .background(
                    LinearGradient(
                        colors: [Color.black.opacity(0), Color.black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 120)
                )
            , alignment: .bottom
        )
    }
}*/

/*

import SwiftUI

struct MainPageView1: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with Filter Menu
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: {
                            viewModel.filterType = .date
                        }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button(action: {
                            viewModel.filterType = .bookmarked
                        }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            .padding(.bottom, 20)
            
            // Journal List
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(viewModel.filteredJournals) { journal in
                        JournalCardView(journal: journal, viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 100)
            }
            
            Spacer()
        }
        .overlay(
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
                .background(
                    LinearGradient(
                        colors: [Color.black.opacity(0), Color.black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 120)
                )
            , alignment: .bottom
        )
    }
}
*/

/*
import SwiftUI

struct EmptyStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: {
                            viewModel.filterType = .date
                        }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button(action: {
                            viewModel.filterType = .bookmarked
                        }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            Spacer()
            
            VStack(spacing: 20) {
                // ✅ الصورة فوق النصوص
                Image("bokudo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .shadow(radius: 5)

                Text("Begin Your Journal")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)

                Text("Craft your personal diary, tap the\nplus icon to begin")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }

            Spacer()
            
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
        }
    }
}

*/

//
//  MainPageView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

import SwiftUI

struct MainPageView1: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with Filter Menu
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: {
                            viewModel.filterType = .date
                        }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button(action: {
                            viewModel.filterType = .bookmarked
                        }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22)
                            .fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22)
                            .fill(
                                LinearGradient(
                                    colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            .padding(.bottom, 20)
            
            // Journal List - FIXED: Added proper bottom padding
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.filteredJournals) { journal in
                        JournalCardView(journal: journal, viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom, 140) // 👈 INCREASED padding to clear search bar
            }
            
            Spacer(minLength: 0)
        }
        .overlay(
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
                .background(
                    LinearGradient(
                        colors: [Color.black.opacity(0), Color.black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 120)
                )
            , alignment: .bottom
        )
        .ignoresSafeArea(edges: .bottom) // 👈 ADDED to prevent safe area issues
    }
}
