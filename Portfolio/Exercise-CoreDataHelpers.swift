//
//  Exercise-CoreDataHelpers.swift
//  Portfolio
//
//  Created by LouR on 12/7/20.
//

import Foundation

extension Exercise {
    var exerciseTitle: String {
        title ?? ""
    }
    
    var exerciseDetail: String {
        detail ?? ""
    }
    
    var exerciseDateCreated: Date {
        dateCreated ?? Date()
    }
    
    static var example: Exercise {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        let exercise = Exercise(context: viewContext)
        exercise.title = "Sample Exercise"
        exercise.detail = "This is a sample descriptions for an exercise."
        exercise.completed = true
        exercise.dateCreated = Date()
        
        return exercise
        
    }
}
