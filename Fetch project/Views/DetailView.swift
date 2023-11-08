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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
       
        ScrollView {
            VStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "multiply.circle.fill")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .font(.largeTitle)
                        .foregroundStyle(.gray)
                        .opacity(0.5)
                })
                
                // MARK: Meal name
                Text(mealDetail?.strMeal ?? "")
                    .font(.largeTitle)
                    .padding([.bottom, .top], 5)
                
                // MARK: Display Meal Images
                if let imageUrl = mealDetail?.strMealThumb {
                    
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
                
                // MARK: Meal Instructions
                Text(mealDetail?.strInstructions ?? "")
                    .padding()
                
                Divider()
                Text("Ingredients")
                    .font(.headline)
                    .padding([.bottom, .top], 5)
                
                Text("\(mealDetail?.strIngredient1 ?? "") - \(mealDetail?.strMeasure1 ?? "")")
                Text("\(mealDetail?.strIngredient2 ?? "") - \(mealDetail?.strMeasure2 ?? "")")
                Text("\(mealDetail?.strIngredient3 ?? "") - \(mealDetail?.strMeasure3 ?? "")")
                Text("\(mealDetail?.strIngredient4 ?? "") - \(mealDetail?.strMeasure4 ?? "")")
                Text("\(mealDetail?.strIngredient5 ?? "") - \(mealDetail?.strMeasure5 ?? "")")
                Text("\(mealDetail?.strIngredient6 ?? "") - \(mealDetail?.strMeasure6 ?? "")")
                Text("\(mealDetail?.strIngredient7 ?? "") - \(mealDetail?.strMeasure7 ?? "")")
                Text("\(mealDetail?.strIngredient8 ?? "") - \(mealDetail?.strMeasure8 ?? "")")
                
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
