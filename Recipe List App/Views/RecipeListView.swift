//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Mac Mini on 5/1/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    private var title: String {
        if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter {
            return Constants.defaultListFilter
        }
        else {
            return model.selectedCategory!
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                HStack (alignment: .bottom) {
                 
                    Text(title)
                        .font(Font.custom("Avenir Heavy", size: 24))
                        .fontWeight(.bold)
                        .padding(.top, 40)
                    Spacer()
                    if model.selectedCategory != nil && model.selectedCategory != Constants.defaultListFilter {
                        Button(action: {
                            // Set selected category back to All Recipes
                            model.selectedCategory = nil
                        }, label: {
                            Text("Show All Recipes")
                        })
                    }
                }
                
                ScrollView {
                    
                    LazyVStack (alignment: .leading) {
                        
                        ForEach(model.recipes) { r in
                            
                            if model.selectedCategory == nil || model.selectedCategory == Constants.defaultListFilter || model.selectedCategory != nil && r.category == model.selectedCategory {
                                
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
                                            VStack (alignment: .leading) {
                                                Text(r.name)
                                                    .foregroundColor(.black)
                                                    .font(Font.custom("Avenir Heavy", size: 16))
                                                RecipeHighlights(highlights: r.highlights)
                                                    .foregroundColor(.black)
                                            }
                                        }
                                    }) // close NavigationLink
                                
                            } // close if
                        } // close ForEach
                    } // close LazyVStack
                    
                } // close ScrollView
                
            } // close VStack
            //.navigationBarTitle("All Recipes")
            .navigationBarHidden(true)
            .padding(.horizontal)
        } // close NavigationView
    } // close body
} // close ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
