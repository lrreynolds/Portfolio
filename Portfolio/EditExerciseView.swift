//
//  EditExerciseView.swift
//  Portfolio
//
//  Created by LouR on 12/9/20.
//

import SwiftUI

struct EditExerciseView: View {
    //MARK: - PROPERTIES
    
    let exercise: Exercise
    
    @EnvironmentObject var dataController: DataController
    
    @State var title: String
    @State var detail: String
    @State var order: Int
    @State var completed: Bool
    
    init(exercise: Exercise) {
        
        self.exercise = exercise
        
        _title = State(wrappedValue: exercise.exerciseTitle)
        _detail = State(wrappedValue: exercise.exerciseDetail)
        _order = State(wrappedValue: Int(exercise.order))
        _completed = State(wrappedValue: exercise.completed)
    }
    
    //MARK: - BODY
    var body: some View {
        Form {
            Section(header: Text("Basic settings:")) {
                TextField("Title:", text: $title.onChange(update))
                TextField("Description:", text: $detail.onChange(update))
            }//: SECTION
            Section(header: Text("Order:")) {
                Picker("Order:", selection: $order.onChange(update)) {
                    Text("Low").tag(1)
                    Text("Medium").tag(2)
                    Text("High").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }//: SECTION
            Section {
                Toggle ("Mark Completed:", isOn: $completed.onChange(update))
            }//: SECTION
        }//: FORM
        .navigationTitle("Edit Exercies")
        .onDisappear(perform: dataController.save)
        
    }
    
    func update() {
        
        exercise.workout?.objectWillChange.send()
        
        exercise.title = title
        exercise.detail = detail
        exercise.order = Int16(order)
        exercise.completed = completed
    }
}

struct EditExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseView(exercise: Exercise.example)
    }
}
