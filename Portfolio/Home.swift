//
//  Home.swift
//  Portfolio
//
//  Created by LouR on 12/6/20.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERTIES
    static let tag: String? = "Home"
    @EnvironmentObject var dataController: DataController
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Button("Add Data") {
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
                .navigationTitle("Home")
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
