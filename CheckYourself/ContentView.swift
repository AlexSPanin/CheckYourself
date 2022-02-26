//
//  ContentView.swift
//  CheckYourself
//
//  Created by Александр Панин on 26.02.2022.
//

import SwiftUI

struct ContentView: View {
   
    @Binding var value: Double
    @Binding var isEditing: Bool
    @State private var currentValue = Double.random(in: 0...100)
    
    
    
    var body: some View {
        VStack {
            
            Slider(value: $value, in: 0...100) {
                Text("Slider Ghjdthrf")
                    Spacer()
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            } onEditingChanged: { editing in
                isEditing = editing 
            }
            .padding()
            
            
            
            Button("Проверь меня!") {}
            .font(.title2)
            .multilineTextAlignment(.center)
            
            Button("Начать заново") {}
            .font(.title2)
            .multilineTextAlignment(.center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(value: .constant(20), isEditing: .constant(true))
    }
}
