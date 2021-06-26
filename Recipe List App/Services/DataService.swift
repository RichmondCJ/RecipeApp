//
//  DataService.swift
//  Recipe List App
//
//  Created by Mac Mini on 5/1/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [Recipe]()
        }
        
        // Get url path to json file
        let url = URL(fileURLWithPath: pathString!)
        
        // Create url object
        do {
            // Create data object
            let data = try Data(contentsOf: url)
         
            // Decode the data with json decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                // Return the recipes
                return recipeData
            }
            catch {
                print("\nError with parsing json\n")
                print(error)
            }
            
        }
        catch {
            print("\nError with getting data\n")
            print(error)
        }
        
        return [Recipe]()  // should not need this, but the func expects a return
        
    }
    
}
