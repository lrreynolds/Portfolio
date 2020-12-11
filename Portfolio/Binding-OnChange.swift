//
//  Binding-OnChange.swift
//  Portfolio
//
//  Created by LouR on 12/10/20.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: {self.wrappedValue },
            set: { newValue in
            self.wrappedValue = newValue
            handler()
        }
       )
    }
    
}
