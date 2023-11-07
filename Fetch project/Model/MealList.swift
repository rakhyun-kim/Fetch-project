//
//  MealList.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import Foundation


struct MealResponse: Codable{
    
    var meals = [Meal]()
    
}

struct Meal: Codable, Identifiable {
    
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
    var id:String {idMeal!}
}
