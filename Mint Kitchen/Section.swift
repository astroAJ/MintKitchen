//
//  Section.swift
//  Mint Kitchen
//
//  Created by Macbook on 22/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import Foundation


struct Section
{
   var recipeCategory : String!
    var recipies : [String]!
    var isExpanded : Bool!
    
    init(recipeCategory : String, recipies : [String], isExpanded : Bool)
    {
        self.recipeCategory = recipeCategory
        self.recipies = recipies
        self.isExpanded = isExpanded
    }
    
    
}
