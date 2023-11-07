//
//  ContentView.swift
//  Fetch project
//
//  Created by Rakhyun Kim on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var business = [Meal()]
    var service = MealListApi()
    
    var body: some View {
        VStack {
            ListView()
        }
    }
}
#Preview {
    ContentView()
}
