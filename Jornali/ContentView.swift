//
//  ContentView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 24/04/1447 AH.
//
/*

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "Empty")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
           
            List {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
*/

/*
import SwiftUI

 
 struct JournalEntry: Identifiable {
     let id: UUID
     var title: String
     var content: String
     var date: Date
     var bookmarked: Bool
 }

class JournalViewModel: ObservableObject {
    @Published var entries: [JournalEntry] = []
    @Published var isEditing = false
    @Published var title = ""
    @Published var content = ""
    @Published var showDiscardAlert = false
    @Published var filterBy: FilterType = .date

    enum FilterType {
        case date
        case bookmarked
    }

    var filteredEntries: [JournalEntry] {
        switch filterBy {
        case .date:
            return entries.sorted { $0.date > $1.date }
        case .bookmarked:
            return entries.filter { $0.bookmarked }.sorted { $0.date > $1.date }
        }
    }

    func addEntry() {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty || !content.trimmingCharacters(in:  .whitespaces).isEmpty else {
            return
        }
        let entry = JournalEntry(
            id: UUID(),
            title: title.isEmpty ? "Untitled" : title,
            content: content,
            date: Date(),
            bookmarked: false
        )
        entries.insert(entry, at: 0)
        clearEditor()
    }

    func toggleBookmark(for entry: JournalEntry) {
        if let index = entries.firstIndex(where: { $0.id == entry.id }) {
            entries[index].bookmarked.toggle()
        }
    }

    func delete(_ entry: JournalEntry) {
        entries.removeAll { $0.id == entry.id }
    }

    func clearEditor() {
        title = ""
        content = ""
        isEditing = false
    }
}

#Preview {
    JournalView()
}
*/

/*

import SwiftUI

// MARK: - Models
struct Journal: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool
    
    init(id: UUID = UUID(), title: String, content: String, date: Date = Date(), isBookmarked: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isBookmarked = isBookmarked
    }
}

enum FilterType {
    case date
    case bookmarked
}

// MARK: - Main App View
struct JournalAppView: View {
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.isEditing {
                EditorView(viewModel: viewModel)
            } else if viewModel.journals.isEmpty {
                EmptyStateView(viewModel: viewModel)
            } else {
                MainPageView(viewModel: viewModel)
            }
            
            // Delete Alert
            if viewModel.showDeleteAlert {
                DeleteAlertView(viewModel: viewModel)
            }
            
            // Discard Changes Alert
            if viewModel.showDiscardAlert {
                DiscardAlertView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - View Model
class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var isEditing = false
    @Published var currentTitle = ""
    @Published var currentContent = ""
    @Published var filterType: FilterType = .date
    @Published var showDeleteAlert = false
    @Published var showDiscardAlert = false
    @Published var deleteTarget: Journal?
    @Published var showFilterMenu = false
    
    var filteredJournals: [Journal] {
        if filterType == .bookmarked {
            return journals.sorted { $0.isBookmarked && !$1.isBookmarked }
        }
        return journals
    }
    
    func startNewJournal() {
        currentTitle = ""
        currentContent = ""
        isEditing = true
    }
    
    func saveJournal() {
        guard !currentTitle.isEmpty || !currentContent.isEmpty else { return }
        
        let newJournal = Journal(
            title: currentTitle.isEmpty ? "Untitled" : currentTitle,
            content: currentContent
        )
        journals.insert(newJournal, at: 0)
        isEditing = false
        currentTitle = ""
        currentContent = ""
    }
    
    func toggleBookmark(for journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }
    
    func requestDelete(journal: Journal) {
        deleteTarget = journal
        showDeleteAlert = true
    }
    
    func confirmDelete() {
        if let target = deleteTarget {
            journals.removeAll { $0.id == target.id }
        }
        deleteTarget = nil
        showDeleteAlert = false
    }
    
    func closeEditor() {
        if !currentTitle.isEmpty || !currentContent.isEmpty {
            showDiscardAlert = true
        } else {
            isEditing = false
        }
    }
    
    func discardChanges() {
        currentTitle = ""
        currentContent = ""
        isEditing = false
        showDiscardAlert = false
    }
}

// MARK: - Empty State View
struct EmptyStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: -18) {
                    Menu {
                        Button(action: { viewModel.filterType = .date }) {
                            Label("By Date", systemImage: "calendar")
                        }
                        Button(action: { viewModel.filterType = .bookmarked }) {
                            Label("Bookmarked", systemImage: "bookmark")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20) // يوسع العرض (الكبسولة)
                                   .padding(.vertical, 15)   // يوسع الارتفاع
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .clipShape(Capsule())
                    }
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20) // يوسع العرض (الكبسولة)
                                   .padding(.vertical, 13)   // يوسع الارتفاع
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .clipShape(Capsule())
                    }
                }
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
            
            SearchBar()
                .padding(.horizontal)
                .padding(.bottom, 30)
        }
    }
}

// MARK: - Main Page View
struct MainPageView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header with Filter Menu
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: -11) {
                    Menu {
                        Button(action: { viewModel.filterType = .date }) {
                            Label("By Date", systemImage: "calendar")
                        }
                        Button(action: { viewModel.filterType = .bookmarked }) {
                            Label("Bookmarked", systemImage: "bookmark")
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                        //تعديل زر لشكل كبسوله
                           .padding(.horizontal, 20) // يوسع العرض (الكبسولة)
                                   .padding(.vertical, 15)   // يوسع الارتفاع
                      
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .clipShape(Capsule())
                    }
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(.horizontal, 20) // يوسع العرض (الكبسولة)
                                   .padding(.vertical, 13)   // يوسع الارتفاع
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .clipShape(Capsule())
                    }
                }
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
            SearchBar()
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

// MARK: - Journal Card View
// كود اللون و حجم البطاقه  تعديل من هنا
struct JournalCardView: View {
    let journal: Journal
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                Text(journal.title)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                
                Text(journal.date.formatted(date: .numeric, time: .omitted))
                    .font(.system(size: 10, ))
                    .foregroundColor(.gray)
                
                Text(journal.content)
                    .font(.system(size: 30 ))
                    .foregroundColor(.gray)
                    .lineLimit(7)
                    .padding(.top, 4)
            }
            
            Spacer()
            
            Button(action: { viewModel.toggleBookmark(for: journal) }) {
                Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(journal.isBookmarked ? Color(red: 0.5, green: 0.6, blue: 1.0) : .gray)
                    .font(.system(size: 20))
            }
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(16)
        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
            Button(role: .destructive) {
                viewModel.requestDelete(journal: journal)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

// MARK: - Editor View
struct EditorView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: { viewModel.closeEditor() }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                        .clipShape(Circle())
                }
                
                Spacer()
                
                Text("New Entry")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: { viewModel.saveJournal() }) {
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)
            .padding(.top, 50)
            .padding(.bottom, 20)
            
            // Title Input
            TextField("Title", text: $viewModel.currentTitle)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Text(Date().formatted(date: .numeric, time: .omitted))
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.bottom, 20)
            
            // Content Input
            TextEditor(text: $viewModel.currentContent)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .padding(.horizontal)
            
            Spacer()
        }
    }
}

// MARK: - Delete Alert View
struct DeleteAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Delete Journal?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Are you sure you want to delete this journal?")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.showDeleteAlert = false
                        viewModel.deleteTarget = nil
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .cornerRadius(12)
                    }
                    
                    Button(action: { viewModel.confirmDelete() }) {
                        Text("Delete")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(24)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(20)
            .padding(.horizontal, 40)
        }
    }
}

// MARK: - Discard Alert View
struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    
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
                
                Button(action: { viewModel.discardChanges() }) {
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

// MARK: - Search Bar
struct SearchBar: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search", text: $searchText)
                .foregroundColor(.white)
            
            Image(systemName: "mic.fill")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(12)
    }
}

// MARK: - Preview
struct JournalAppView_Previews: PreviewProvider {
    static var previews: some View {
        JournalAppView()
    }
}
*/
/* ymmmmmy code*



import SwiftUI

// MARK: - Models
struct Journal: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool
    
    init(id: UUID = UUID(), title: String, content: String, date: Date = Date(), isBookmarked: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isBookmarked = isBookmarked
    }
}

enum FilterType {
    case date
    case bookmarked
}

// MARK: - Main App View
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
        }
    }
}

// MARK: - View Model
class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var isEditing = false
    @Published var currentTitle = ""
    @Published var currentContent = ""
    @Published var filterType: FilterType = .date
    @Published var showDeleteAlert = false
    @Published var showDiscardAlert = false
    @Published var deleteTarget: Journal?
    @Published var searchText = ""
    
    var filteredJournals: [Journal] {
        var result = journals
        
        // Apply search filter
        if !searchText.isEmpty {
            result = result.filter { journal in
                journal.title.localizedCaseInsensitiveContains(searchText) ||
                journal.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Apply sort filter
        switch filterType {
        case .date:
            return result.sorted { $0.date > $1.date }
        case .bookmarked:
            return result.sorted { journal1, journal2 in
                if journal1.isBookmarked == journal2.isBookmarked {
                    return journal1.date > journal2.date
                }
                return journal1.isBookmarked && !journal2.isBookmarked
            }
        }
    }
    
    func startNewJournal() {
        currentTitle = ""
        currentContent = ""
        isEditing = true
    }
    
    func saveJournal() {
        guard !currentTitle.isEmpty || !currentContent.isEmpty else {
            isEditing = false
            return
        }
        
        let newJournal = Journal(
            title: currentTitle.isEmpty ? "Untitled" : currentTitle,
            content: currentContent
        )
        journals.insert(newJournal, at: 0)
        isEditing = false
        currentTitle = ""
        currentContent = ""
    }
    
    func toggleBookmark(for journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }
    
    func requestDelete(journal: Journal) {
        deleteTarget = journal
        showDeleteAlert = true
    }
    
    func confirmDelete() {
        if let target = deleteTarget {
            journals.removeAll { $0.id == target.id }
        }
        deleteTarget = nil
        showDeleteAlert = false
    }
    
    func closeEditor() {
        if !currentTitle.isEmpty || !currentContent.isEmpty {
            showDiscardAlert = true
        } else {
            isEditing = false
        }
    }
    
    func discardChanges() {
        currentTitle = ""
        currentContent = ""
        isEditing = false
        showDiscardAlert = false
    }
}

// MARK: - Empty State View
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
                            .frame(height: 44)
                            .padding(.horizontal, 16)
                    }
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .clipShape(Capsule())
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(height: 44)
                            .padding(.horizontal, 16)
                    }
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .clipShape(Capsule())
                    .offset(x: -12)
                }
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

// MARK: - Main Page View
struct MainPageView: View {
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
                            .frame(height: 44)
                            .padding(.horizontal, 16)
                    }
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .clipShape(Capsule())
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(height: 44)
                            .padding(.horizontal, 16)
                    }
                    .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                    .clipShape(Capsule())
                    .offset(x: -12)
                }
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

// MARK: - Journal Card View
struct JournalCardView: View {
    let journal: Journal
    @ObservedObject var viewModel: JournalViewModel
    @State private var offset: CGFloat = 0
    @State private var showingDeleteButton = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Delete Button Background (Red Circle)
            if showingDeleteButton {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            offset = 0
                            showingDeleteButton = false
                        }
                        viewModel.requestDelete(journal: journal)
                    }) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                }
            }
            
            // Card Content
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(journal.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                    
                    Text(journal.date.formatted(date: .numeric, time: .omitted))
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    
                    Text(journal.content)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(3)
                        .padding(.top, 4)
                }
                
                Spacer()
                
                Button(action: { viewModel.toggleBookmark(for: journal) }) {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(journal.isBookmarked ? Color(red: 0.5, green: 0.6, blue: 1.0) : .gray)
                        .font(.system(size: 20))
                }
            }
            .padding()
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(16)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            offset = max(gesture.translation.width, -80)
                        } else if showingDeleteButton {
                            offset = gesture.translation.width - 80
                        }
                    }
                    .onEnded { gesture in
                        if gesture.translation.width < -50 {
                            withAnimation(.spring()) {
                                offset = -80
                                showingDeleteButton = true
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = 0
                                showingDeleteButton = false
                            }
                        }
                    }
            )
        }
    }
}

// MARK: - Editor View (Sheet)
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
                            .background(Color(red: 0.18, green: 0.18, blue: 0.19))
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

// MARK: - Delete Alert View
struct DeleteAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Delete Journal?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Are you sure you want to delete this journal?")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.showDeleteAlert = false
                        viewModel.deleteTarget = nil
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .cornerRadius(12)
                    }
                    
                    Button(action: { viewModel.confirmDelete() }) {
                        Text("Delete")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(24)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(20)
            .padding(.horizontal, 40)
        }
    }
}

// MARK: - Discard Alert View
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

// MARK: - Search Bar
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
            } else {
                Image(systemName: "mic.fill")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color(red: 0.12, green: 0.12, blue: 0.12))
        .cornerRadius(12)
    }
}

// MARK: - Preview
struct JournalAppView_Previews: PreviewProvider {
    static var previews: some View {
        JournalAppView()
    }
}
*/

/*

import SwiftUI

// MARK: - Models
struct Journal: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date
    var isBookmarked: Bool
    
    init(id: UUID = UUID(), title: String, content: String, date: Date = Date(), isBookmarked: Bool = false) {
        self.id = id
        self.title = title
        self.content = content
        self.date = date
        self.isBookmarked = isBookmarked
    }
}

enum FilterType {
    case date
    case bookmarked
}

// MARK: - Main App View
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
                .presentationBackground(Color.clear)
        }
    }
}

// MARK: - View Model
class JournalViewModel: ObservableObject {
    @Published var journals: [Journal] = []
    @Published var isEditing = false
    @Published var currentTitle = ""
    @Published var currentContent = ""
    @Published var filterType: FilterType = .date
    @Published var showDeleteAlert = false
    @Published var showDiscardAlert = false
    @Published var deleteTarget: Journal?
    @Published var searchText = ""
    
    var filteredJournals: [Journal] {
        var result = journals
        
        // Apply search filter
        if !searchText.isEmpty {
            result = result.filter { journal in
                journal.title.localizedCaseInsensitiveContains(searchText) ||
                journal.content.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        // Apply sort filter
        switch filterType {
        case .date:
            return result.sorted { $0.date > $1.date }
        case .bookmarked:
            return result.sorted { journal1, journal2 in
                if journal1.isBookmarked == journal2.isBookmarked {
                    return journal1.date > journal2.date
                }
                return journal1.isBookmarked && !journal2.isBookmarked
            }
        }
    }
    
    func startNewJournal() {
        currentTitle = ""
        currentContent = ""
        isEditing = true
    }
    
    func saveJournal() {
        guard !currentTitle.isEmpty || !currentContent.isEmpty else {
            isEditing = false
            return
        }
        
        let newJournal = Journal(
            title: currentTitle.isEmpty ? "Untitled" : currentTitle,
            content: currentContent
        )
        journals.insert(newJournal, at: 0)
        isEditing = false
        currentTitle = ""
        currentContent = ""
    }
    
    func toggleBookmark(for journal: Journal) {
        if let index = journals.firstIndex(where: { $0.id == journal.id }) {
            journals[index].isBookmarked.toggle()
        }
    }
    
    func requestDelete(journal: Journal) {
        deleteTarget = journal
        showDeleteAlert = true
    }
    
    func confirmDelete() {
        if let target = deleteTarget {
            journals.removeAll { $0.id == target.id }
        }
        deleteTarget = nil
        showDeleteAlert = false
    }
    
    func closeEditor() {
        if !currentTitle.isEmpty || !currentContent.isEmpty {
            showDiscardAlert = true
        } else {
            isEditing = false
        }
    }
    
    func discardChanges() {
        currentTitle = ""
        currentContent = ""
        isEditing = false
        showDiscardAlert = false
    }
}

// MARK: - Empty State View
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

// MARK: - Main Page View
struct MainPageView: View {
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

// MARK: - Journal Card View
struct JournalCardView: View {
    let journal: Journal
    @ObservedObject var viewModel: JournalViewModel
    @State private var offset: CGFloat = 0
    @State private var showingDeleteButton = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            // Delete Button Background (Red Circle)
            if showingDeleteButton {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            offset = 0
                            showingDeleteButton = false
                        }
                        viewModel.requestDelete(journal: journal)
                    }) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                }
            }
            
            // Card Content
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(journal.title)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(Color(red: 0.831, green: 0.784, blue: 1.0))
                    
                    Text(journal.date.formatted(date: .numeric, time: .omitted))
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    
                    Text(journal.content)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .lineLimit(3)
                        .padding(.top, 4)
                }
                
                Spacer()
                
                Button(action: { viewModel.toggleBookmark(for: journal) }) {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(journal.isBookmarked ? Color(red: 0.5, green: 0.6, blue: 1.0) : .gray)
                        .font(.system(size: 20))
                }
            }
            .padding()
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.white.opacity(0.06))
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [Color.white.opacity(0.1), Color.white.opacity(0.03)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.white.opacity(0.12), lineWidth: 0.5)
                }
            )
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
            .cornerRadius(16)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            offset = max(gesture.translation.width, -80)
                        } else if showingDeleteButton {
                            offset = gesture.translation.width - 80
                        }
                    }
                    .onEnded { gesture in
                        if gesture.translation.width < -50 {
                            withAnimation(.spring()) {
                                offset = -80
                                showingDeleteButton = true
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = 0
                                showingDeleteButton = false
                            }
                        }
                    }
            )
        }
    }
}

// MARK: - Editor View (Sheet)
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

// MARK: - Delete Alert View
struct DeleteAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Delete Journal?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Are you sure you want to delete this journal?")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.showDeleteAlert = false
                        viewModel.deleteTarget = nil
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.15, green: 0.15, blue: 0.15))
                            .cornerRadius(12)
                    }
                    
                    Button(action: { viewModel.confirmDelete() }) {
                        Text("Delete")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(24)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(20)
            .padding(.horizontal, 40)
        }
    }
}

// MARK: - Discard Alert View
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

// MARK: - Search Bar
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

// MARK: - Preview
struct JournalAppView_Previews: PreviewProvider {
    static var previews: some View {
        JournalAppView()
    }
}

*/
