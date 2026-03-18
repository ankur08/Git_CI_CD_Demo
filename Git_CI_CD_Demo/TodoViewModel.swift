//
//  TodoViewModel.swift
//  Git_CI_CD_Demo
//
//  Created by Ankur Nema on 18/03/26.
//

import Foundation
internal import Combine
class TodoViewModel :  ObservableObject {
    @Published var tasks: [TodoTask] = [TodoTask(name: "go to Gym"),
                                        TodoTask(name: "by shirt"),
                                        TodoTask(name: "work on swift ui App")]
    
    func addTask(taskName: String){
        guard !taskName.isEmpty else { return }
        let newTask = TodoTask(name: taskName)
        tasks.append(newTask)
    }
}
