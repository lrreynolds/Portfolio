//
//  Workout-CoreDataHelpers.swift
//  Portfolio
//
//  Created by LouR on 12/7/20.
//

import Foundation

extension Workout {
    var workoutTitle: String {
        title ?? ""
    }
    var workoutDetail: String {
        detail ?? ""
    }
    
    var workoutDateCreated: Date {
        dateCreated ?? Date()
    }
    
    var workoutExercises: [Exercise] {
        let exerciseArray = exercises?.allObjects as? [Exercise] ?? []
        
        return exerciseArray.sorted {first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            
            if first.order < second.order {
                return true
            } else if first.order > second.order {
                return false
            }
            
            return first.exerciseDateCreated < second.exerciseDateCreated
        }
    }
    
    var completeionAmount: Double {
        let originalExercises = exercises?.allObjects as? [Exercise] ?? []
        guard originalExercises.isEmpty == false else {return 0}
       
        let completedExercies = originalExercises.filter(\.completed)
        return Double(completedExercies.count) / Double(originalExercises.count)
    }
    
    static var example: Workout {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let workout = Workout(context: viewContext)
        workout.title = "Sample Workout"
        workout.detail = "This is a sample descriptions for an workout."
        workout.completed = true
        workout.dateCreated = Date()
        
        return workout
        
    }
    
}
