//
//  JournalAppView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
import Foundation
import SwiftUI

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
*///
//  JournalAppView.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 01/05/1447 AH.
//
/*
import Foundation
import SwiftUI

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
*/


import Foundation
import SwiftUI

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
