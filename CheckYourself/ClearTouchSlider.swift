//
//  ClearTouchSlider.swift
//  CheckYourself
//
//  Created by Александр Панин on 26.02.2022.
//

import SwiftUI

struct ClearTouchSlider: UIViewRepresentable {
    
    @Binding var value: Double
    var minValue: Int
    var maxValue: Int
    var colorThumb: Color
    var check: Int
    
    func makeUIView(context: Context) -> UISlider {
        
        let slider = UISlider()
        
        slider.value = Float(value)
        slider.minimumValue = Float(minValue)
        slider.maximumValue = Float(maxValue)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeValue),
            for: .valueChanged)
        
        return slider
        
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let uiColor = UIColor(colorThumb)
        let ciColor = CIColor(color: uiColor)
        let alpha = CGFloat(checkValue())
        
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(
            displayP3Red: ciColor.red,
            green: ciColor.green,
            blue: ciColor.blue,
            alpha: alpha
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    private func checkValue() -> Float {
        let value = Int(round(value))
        let difference = abs(check - value)
        let alpha: Float = (Float(maxValue) - Float(difference)) / Float(maxValue)
        return alpha
    }
}

extension ClearTouchSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func changeValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
