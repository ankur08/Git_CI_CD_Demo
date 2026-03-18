//
//  ContentView.swift
//  Git_CI_CD_Demo
//
//  Created by Ankur Nema on 18/03/26.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTask: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            
            // MARK: - Task List
            List {
                ForEach(viewModel.tasks) { task in
                    Text(task.name)
                        .strikethrough(task.isCompleted)
                        .foregroundColor(task.isCompleted ? .gray : .primary)
                        .swipeActions {
                            
                            // Delete Action
                            Button(role: .destructive) {
                                delete(task: task)
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            // Complete Action
                            Button {
                                markComplete(task: task)
                            } label: {
                                Label("Complete", systemImage: "checkmark")
                            }
                            .tint(.green)
                        }
                }
            }
            
            // MARK: - Input Section
            HStack {
                TextField("Enter a new Task", text: $newTodoTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .submitLabel(.done)
                    .onSubmit {
                        addTask()
                    }
                
                Button("Add Task") {
                    addTask()
                }
                .disabled(newTodoTask.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
        .padding()
    }
}

// MARK: - Helper Methods
extension ContentView {
    
    private func addTask() {
        let trimmed = newTodoTask.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        viewModel.addTask(taskName: trimmed)
        newTodoTask = ""
    }
    
    private func delete(task: TodoTask) {
        viewModel.tasks.removeAll { $0.id == task.id }
    }
    
    private func markComplete(task: TodoTask) {
        if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id }) {
            viewModel.tasks[index].isCompleted.toggle()
        }
    }
}
#Preview {
    ContentView()
}
