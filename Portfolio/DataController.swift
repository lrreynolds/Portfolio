//
//  DataController.swift
//  Portfolio
//
//  Created by LouR on 12/5/20.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Fatal error in loading data: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
            
        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }
        
        return dataController
        
    }()
    
    
    func createSampleData() throws {
        let viewContext = container.viewContext
        
        for i in 1...5 {
             let workout = Workout(context: viewContext)
            workout.title = ("Workout: \(i)")
            workout.exercises = []
            workout.completed = Bool.random()
            workout.dateCreated = Date()
            
        
        for j in 1...10 {
             let exercise = Exercise(context: viewContext)
            exercise.title = ("Workout: \(j)")
            exercise.completed = Bool.random()
            exercise.dateCreated = Date()
            exercise.workout = workout
            exercise.order = Int16(j)
            exercise.timeSeconds = 45
            exercise.restSeconds = 30
            
        }
        }
        try viewContext.save()
    }
    
    func save() {
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
   
    func deleteAll () {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = Exercise.fetchRequest()
        let batchDeleteRequest1 =  NSBatchDeleteRequest(fetchRequest: fetchRequest1)
        _ = try? container.viewContext.execute(batchDeleteRequest1)
        
        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Workout.fetchRequest()
        let batchDeleteRequest2 =  NSBatchDeleteRequest(fetchRequest: fetchRequest2)
        _ = try? container.viewContext.execute(batchDeleteRequest2)
    }
}
