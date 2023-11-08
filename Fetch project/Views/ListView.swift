//
//  ListView.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import SwiftUI

struct ListView: View {
    
    @State var business = [Meal()]
    @State var selectedMeal: Meal?
    var mealListApi = MealListApi()

    var body: some View {
        
        NavigationView {
            // Display images
            List {
                ForEach(business, id: \.idMeal) { b in
                    VStack {
                        HStack {
                            // Display images
                            if let imageUrl = b.strMealThumb {
                                AsyncImage(url: URL(string: imageUrl)!) { image in
                                    image
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(.trailing, 16)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                            }
                            
                            Text(b.strMeal ?? "")
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                .foregroundStyle(.gray)
                                .opacity(0.5)
                        }
                    }
                    .onTapGesture {
                        selectedMeal = b
                    }
                }
            }
            .listStyle(.plain)
            .padding()
            .task {
                business = await mealListApi.apiCall()
            }
            .sheet(item: $selectedMeal) { meal in
                DetailView(idMeal: meal.idMeal)
            }
            .navigationTitle("Dessert")
        }
        
    }
}

#Preview {
    ListView()
}
