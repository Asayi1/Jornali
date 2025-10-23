//
//  JournalEditorView 2.swift
//  Jornali
//
//  Created by Asail abdulmohsin on 29/04/1447 AH.
//


import SwiftUI

struct JournalEditorView: View {
    @ObservedObject var vm: JournalViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                TextField("Title", text: $vm.title)
                    .font(.title2.bold())
                    .padding()

                TextEditor(text: $vm.content)
                    .padding()
                    .frame(height: 300)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("New Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        if !vm.title.isEmpty || !vm.content.isEmpty {
                            vm.showDiscardAlert = true
                        } else {
                            vm.clearEditor()
                        }
                    }
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        vm.addEntry()
                    }
                }
            }
            .alert("Discard Changes?", isPresented: $vm.showDiscardAlert) {
                Button("Discard", role: .destructive) {
                    vm.clearEditor()
                }
                Button("Keep Editing", role: .cancel) {}
            } message: {
                Text("Are you sure you want to discard your changes?")
            }
        }
    }
}
