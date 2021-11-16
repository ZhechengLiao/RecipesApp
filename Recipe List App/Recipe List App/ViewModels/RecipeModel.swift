//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
    }
    
    static func getProtion(ingredient:Ingredient, recipesServings:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholeProtions = 0
        
        if ingredient.num != nil {
            denominator *= recipesServings
            
            numerator *= targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if numerator > denominator {
                
                wholeProtions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholeProtions)
            }
            
            if numerator > 0 {
                portion += wholeProtions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if let unit = ingredient.unit {
            
            portion += ingredient.unit == nil && ingredient.denom == nil ? "":" "
            
            return portion + unit
        }
        
        return portion
    }
}
