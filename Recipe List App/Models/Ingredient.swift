//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Mac Mini on 7/4/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
