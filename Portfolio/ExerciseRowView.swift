//
//  ExerciseRowView.swift
//  Portfolio
//
//  Created by LouR on 12/9/20.
//

import SwiftUI

struct ExerciseRowView: View {
    @ObservedObject var exercise: Exercise
    
    var body: some View {
        NavigationLink(destination: EditExerciseView(exercise: exercise)) {
        Text(exercise.exerciseTitle)
            }
    }
}

struct ExerciseRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseRowView(exercise: Exercise.example)
    }
}
