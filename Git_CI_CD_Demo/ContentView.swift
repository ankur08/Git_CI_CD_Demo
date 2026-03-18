//
//  ContentView.swift
//  Git_CI_CD_Demo
//
//  Created by Ankur Nema on 18/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TodoViewModel()
    @State private var newTodoTask : String = ""
    
    var body: some View {
        VStack {
            List (viewModel.tasks){ task in
                Text(task.name)
            }
            HStack {
                TextField("Enter a new Task", text: $newTodoTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    viewModel.addTask(taskName: newTodoTask)
                    newTodoTask = ""
                } label: {
                    Text("Add Task")
                }

            }
        }
        .padding()
        
    }

}

#Preview {
    ContentView()
}
