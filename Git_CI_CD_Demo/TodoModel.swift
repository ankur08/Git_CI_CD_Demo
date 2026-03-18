//
//  TodoModel.swift
//  Git_CI_CD_Demo
//
//  Created by Ankur Nema on 18/03/26.
//

import Foundation
struct TodoTask: Identifiable {
    let id = UUID()
    var name: String
    var isCompleted: Bool = false
}
