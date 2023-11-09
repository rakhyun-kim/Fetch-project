//
//  MealList_Api.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import Foundation

struct MealListApi {
    
    func apiCall() async -> [Meal] {
        
        // 1. URL
        if let url = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") {
            // 2. Create Url
            let request = URLRequest(url: url)
            
            // 3. Send request
            do{
                let (data, response) = try await URLSession.shared.data(for:request)
                
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(MealResponse.self, from: data)
                
                // Sorted alphabetically
                var meals = result.meals
                meals.sort { $0.strMeal! < $1.strMeal! }
                return meals
                
            }
            catch {
                print(error)
            }
        }
        return [Meal]()
    }
}
