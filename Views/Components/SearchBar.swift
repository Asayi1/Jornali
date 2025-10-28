//
//  SearchBar.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

/*

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 16))
            
            TextField("Search", text: $searchText)
                /*.foregroundColor(.white)*/             .font(.system(size: 16))
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
            } else {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.08))
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.12), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
*/

/*
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 16))
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
                .font(.system(size: 16))
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
            } else {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.08))
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.12), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
*/


//
//  SearchBar.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
//
//  SearchBar.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
 import SwiftUI
 import UIKit
 
 struct SearchBar: UIViewRepresentable {
 @Binding var searchText: String
 
 class Coordinator: NSObject, UISearchBarDelegate {
 @Binding var text: String
 
 init(text: Binding<String>) {
 _text = text
 }
 
 func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
 text = searchText
 }
 }
 
 func makeCoordinator() -> Coordinator {
 return Coordinator(text: $searchText)
 }
 
 func makeUIView(context: Context) -> UISearchBar {
 let searchBar = UISearchBar(frame: .zero)
 searchBar.delegate = context.coordinator
 searchBar.placeholder = "Search"
 searchBar.searchBarStyle = .minimal
 searchBar.barStyle = .black
 
 // Style the search bar
 if let textField = searchBar.value(forKey: "searchField") as? UITextField {
 textField.backgroundColor = UIColor(white: 0.12, alpha: 1.0)
 textField.textColor = .white
 textField.tintColor = .white
 textField.attributedPlaceholder = NSAttributedString(
 string: "Search",
 attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
 )
 
 // Left magnifying glass icon
 if let leftView = textField.leftView as? UIImageView {
 leftView.tintColor = .gray
 }
 
 // Clear button
 if let clearButton = textField.value(forKey: "clearButton") as? UIButton {
 clearButton.setImage(clearButton.image(for: .normal)?.withRenderingMode(.alwaysTemplate), for: .normal)
 clearButton.tintColor = .gray
 }
 }
 
 return searchBar
 }
 
 func updateUIView(_ uiView: UISearchBar, context: Context) {
 uiView.text = searchText
 }
 }
 
*/
//
//  SearchBar.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(12)
    }
}
*/





/*
import SwiftUI

// MARK: - الشاشة الرئيسية
struct SearchBar: View {
    @StateObject private var viewModel = JournalViewModel()
    @State private var searchText = ""

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                // 🔍 Glass Search Bar
                GlassSearchBar(searchText: $searchText)
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                Spacer(minLength: 10)
                
                if filteredJournals.isEmpty {
                    EmptyStateView(viewModel: viewModel)
                } else {
                    MainPageView(viewModel: viewModel)
                }
            }
            
            // 🗑️ Delete Alert
            if viewModel.showDeleteAlert {
                DeleteAlertView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $viewModel.isEditing) {
            EditorView(viewModel: viewModel)
                .presentationBackground(Color.clear)
        }
    }
    
    // MARK: - فلترة حسب البحث
    private var filteredJournals: [Journal] {
        if searchText.isEmpty {
            return viewModel.journals
        } else {
            return viewModel.journals.filter {
                $0.title.localizedCaseInsensitiveContains(searchText) ||
                $0.content.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    JournalAppView()
}




// MARK: - Glass Search Bar Component
struct GlassSearchBar: View {
    @Binding var searchText: String       // ✅ هنا الحل الصحيح
    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.white.opacity(0.7))
            
            TextField("Search journals...", text: $searchText) // ✅ استخدم binding هنا
                .focused($isFocused)
                .textFieldStyle(.plain)
                .foregroundColor(.white)
                .tint(.white)
            
            if !searchText.isEmpty {
                Button {
                    searchText = ""
                    isFocused = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
        }
        .padding(10)
        .background(.ultraThinMaterial) // 🌫️ الزجاج الشفاف
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(.white.opacity(0.2), lineWidth: 1)
        )
        .shadow(color: .white.opacity(0.05), radius: 10, x: 0, y: 4)
    }
}
*/

//
//  SearchBar.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//

/*

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 16))
            
            TextField("Search", text: $searchText)
                /*.foregroundColor(.white)*/             .font(.system(size: 16))
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
            } else {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.08))
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.12), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
*/

/*
import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 16))
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
                .font(.system(size: 16))
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                }
            } else {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.08))
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.12), Color.white.opacity(0.05)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.15), lineWidth: 0.5)
            }
        )
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
    }
}
*/

/*

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(12)
    }
}
*/

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(12)
    }
}
