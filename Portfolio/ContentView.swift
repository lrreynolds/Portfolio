//
//  ContentView.swift
//  Portfolio
//
//  Created by LouR on 12/5/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            WorkoutsView(showCompletedWorkouts: false)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            
            WorkoutsView(showCompletedWorkouts: true)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }

        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }

}
