//
//  MealDetail_Api.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import Foundation

struct MealDetailApi {
    
    func apiCall2(idMeal: String) async -> Mealdetail? {
        
        // 1. URL TODO: I need to use Unique ID when click the link
        if let url = URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=\(idMeal)")
        {
            // 2. Create Url
            let request = URLRequest(url: url)
            
            // 3. Send request
            do{
                let (data, response) = try await URLSession.shared.data(for:request)
                
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(mealDetailList.self, from: data)
                
                // Sorted alphabetically
                var meals = result.meals
                meals.sort { $0.strMeal! < $1.strMeal! }
                return meals.first
                
            }
            catch {
                print(error)
            }
        }
        return nil
    }
}
