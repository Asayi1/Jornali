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
