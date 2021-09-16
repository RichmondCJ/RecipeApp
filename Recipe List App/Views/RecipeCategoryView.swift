//
//  RecipeCategoryView.swift
//  Recipe List App
//
//  Created by Mac Mini on 9/15/21.
//

import SwiftUI

struct RecipeCategoryView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    @Binding var selectedTab: Int
        
    var body: some View {
        
        VStack (alignment: .leading) {
         
            Text("Categories")
                .font(Font.custom("Avenir Heavy", size: 24))
                .fontWeight(.bold)
                .padding(.top, 40)
            
            GeometryReader { geom in
            
                ScrollView(showsIndicators: false) {
                
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20, alignment: .top), GridItem(.flexible(), spacing: 20, alignment: .top)], alignment: .center, spacing: 20) {
                        ForEach (Array(model.categories), id: \.self) { category in
                            Button(action: {
                                // Switch tab to ListView
                                selectedTab = Constants.listTab
                                // Set the selected category
                                model.selectedCategory = category
                            }, label: {
                                VStack {
                                    Image(category.lowercased())
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: (geom.size.width - 20) / 2, height: (geom.size.width - 20) / 2)
                                        .cornerRadius(10)
                                        .clipped()
                                    Text(category)
                                        .foregroundColor(.black)
                                }
                            })
                        } // close ForEach
                        
                    } // close LazyVGrid
                    .padding(.bottom, 30)
                    
                } // close ScrollView
                
            } // close GeometryReader
            
        } // close VStack
        .padding(.horizontal)
        
    } // close body
} // close RecipeCategoryView


//struct RecipeCategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeCategoryView()
//    }
//}
