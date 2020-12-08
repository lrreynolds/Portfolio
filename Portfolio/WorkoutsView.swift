//
//  WorkoutsView.swift
//  Portfolio
//
//  Created by LouR on 12/6/20.
//

import SwiftUI

struct WorkoutsView: View {
    //MARK: - PROPERTIES
    
    static let openTag: String? = "Open"
    static let closedTag: String? = "Closed"
    let showCompletedWorkouts: Bool
    
    let workouts: FetchRequest<Workout>
    
    init(showCompletedWorkouts: Bool) {
        self.showCompletedWorkouts = showCompletedWorkouts
        workouts = FetchRequest<Workout> (entity: Workout.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Workout.dateCreated, ascending: false)
        ], predicate: NSPredicate(format: "completed = %d", showCompletedWorkouts))
        
    }
    
    
    //MARK: - BODY
    var body: some View {
        NavigationView{
            List {
                ForEach(workouts.wrappedValue) {workout in
                    Section(header: Text(workout.workoutTitle)) {
                        ForEach(workout.workoutExercises) {exercise in
                            Text(exercise.exerciseTitle)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showCompletedWorkouts ?  "Closed Workouts:" : "Open Workouts:")
        }
    }
}

struct WorkoutsView_Previews: PreviewProvider {
    
    static var dataController = DataController.preview
    static var previews: some View {
        WorkoutsView(showCompletedWorkouts: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
