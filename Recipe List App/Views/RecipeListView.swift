//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Mac Mini on 5/1/21.
//

import SwiftUI

struct RecipeListView: View {
    
    // Reference the view model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        
                        // MARK: Row item
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: .center)
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }
                    })
                
                
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
