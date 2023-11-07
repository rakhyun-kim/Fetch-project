//
//  DetailView.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import SwiftUI

struct DetailView: View {
    
    @State var mealDetail: Mealdetail?
    var idMeal: String?
    var mealDetailApi = MealDetailApi()
    var ingredients: [String] = []
    
    var body: some View {
       
        ScrollView {
            VStack {
                
                if let imageUrl = mealDetail?.strMealThumb {
                    // Display Meal Images
                    AsyncImage(url: URL(string: imageUrl)!) { image in
                        image
                            .resizable()
                            .frame(width:250, height: 250)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                    } placeholder: {
                        ProgressView()
                            .frame(width:50, height: 50)
                    }
                }
                else {
                    Image(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                }
                
                // MARK: Meal name
                Text(mealDetail?.strMeal ?? "")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                // MARK: Meal Instructions
                Text(mealDetail?.strInstructions ?? "")
                    .padding()
                
                Divider()
                Text("Ingredients")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                
                    Section {
                        HStack {
                            Text(mealDetail?.strIngredient1 ?? "")
                            Text(" - ")
                            Text(mealDetail?.strMeasure1 ?? "")
                        }
                    }
                    
                    Text(mealDetail?.strIngredient2 ?? "")
                    Text(mealDetail?.strIngredient3 ?? "")
                    Text(mealDetail?.strIngredient4 ?? "")
                    Text(mealDetail?.strIngredient5 ?? "")
                    Text(mealDetail?.strIngredient6 ?? "")
                    Text(mealDetail?.strIngredient7 ?? "")
                    Text(mealDetail?.strIngredient8 ?? "")
                    Text(mealDetail?.strIngredient9 ?? "")
                    Text(mealDetail?.strIngredient10 ?? "")
                    Text(mealDetail?.strIngredient11 ?? "")
                    Text(mealDetail?.strIngredient12 ?? "")
                    Text(mealDetail?.strIngredient13 ?? "")
                    Text(mealDetail?.strIngredient14 ?? "")
                    Text(mealDetail?.strIngredient15 ?? "")
                    Text(mealDetail?.strIngredient16 ?? "")
                    Text(mealDetail?.strIngredient17 ?? "")
                    Text(mealDetail?.strIngredient18 ?? "")
                    Text(mealDetail?.strIngredient19 ?? "")
                    Text(mealDetail?.strIngredient20 ?? "")
                
            }
            .task {
                mealDetail = await mealDetailApi.apiCall2(idMeal: idMeal ?? "")
            }
        }
    }
        
}

#Preview {
    DetailView()
}
