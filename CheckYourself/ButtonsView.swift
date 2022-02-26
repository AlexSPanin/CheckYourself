//
//  ButtonsView.swift
//  CheckYourself
//
//  Created by Александр Панин on 26.02.2022.
//

import SwiftUI

struct ButtonsView: View {
    
    @Binding var currentValue: Int
    @State private var isCheck: Bool = false
    
    var value: Double
    var minValue: Int
    var maxValue: Int
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Button("Проверь меня!") { isCheck.toggle() }
            .font(.title2)
            .multilineTextAlignment(.center)
            .alert("Your Score", isPresented: $isCheck, actions: {}) {
                Text("\(Int(value))")
            }
            
            Button("Начать заново") { changeValue() }
            .font(.title2)
            .multilineTextAlignment(.center)
        }
    }
}

extension ButtonsView {
    private func changeValue() {
        currentValue = Int.random(in: minValue...maxValue)
    }
}

struct ButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsView(currentValue: .constant(20), value: 20, minValue: 0, maxValue: 100)
    }
}
