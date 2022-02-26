//
//  CheckYourselfApp.swift
//  CheckYourself
//
//  Created by Александр Панин on 26.02.2022.
//

import SwiftUI

@main
struct CheckYourselfApp: App {
    
    @State private var value: Double = 20
    @State private var isEditing: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ContentView(value: $value, isEditing: $isEditing)
        }
    }
}
