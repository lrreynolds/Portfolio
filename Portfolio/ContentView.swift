//
//  ContentView.swift
//  Portfolio
//
//  Created by LouR on 12/5/20.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @SceneStorage ("selectedView") var selectedView: String?
    
    
    //MARK: - BODY
    var body: some View {
        TabView(selection: $selectedView) {
            Home()
                .tag(Home.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            WorkoutsView(showCompletedWorkouts: false)
                .tag(WorkoutsView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }
            
            WorkoutsView(showCompletedWorkouts: true)
                .tag(WorkoutsView.closedTag)
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
