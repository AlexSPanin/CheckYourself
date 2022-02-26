//
//  ContentView.swift
//  CheckYourself
//
//  Created by Александр Панин on 26.02.2022.
//

import SwiftUI

struct ContentView: View {
   
    @State private var value: Double = 20
    @State private var isEditing: Bool = false
    @State private var currentValue = 100
    
    private let minValue = 0
    private let maxValue = 100
    
    var body: some View {
        
        VStack (alignment: .center, spacing: 5){
            Text("Пододвиньте слайдер как можно ближе к: \(currentValue)")
                .font(.body)
                .multilineTextAlignment(.center)
            
            HStack (alignment: .center, spacing: 5){
                Text("\(minValue)")
                    .font(.caption)
                ClearTouchSlider(
                    value: $value,
                    minValue: minValue,
                    maxValue: maxValue,
                    colorThumb: .red,
                    check: currentValue
                )
                Text("\(maxValue)")
                    .font(.caption)
            }
            .padding()
            
          ButtonsView(
            currentValue: $currentValue,
            value: value,
            minValue: minValue,
            maxValue: maxValue
          )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
