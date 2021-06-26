//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Mac Mini on 6/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("• " + item)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    ForEach(0..<recipe.directions.count, id: \.self) {index in
                        Text(String(index+1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create dummy recipe and pass through, for testing
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
