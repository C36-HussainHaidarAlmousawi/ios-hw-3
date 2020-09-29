//
//  File.swift
//  hw3-p1
//
//  Created by hussain haidar almousawi on 9/24/20.
//

import Foundation

class BMIModel {
    var height:Double
    var weight:Double
    
    init(height:Double , weight:Double) {
        self.height = height
        self.weight = weight
    }
    func bmi() -> Double {
        weight/(height*height)
    }
}
