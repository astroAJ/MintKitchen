//
//  RecipeCell.swift
//  Mint Kitchen
//
//  Created by Macbook on 21/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell
{

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipePrice: UILabel!
    @IBOutlet weak var recipeType: UIImageView!
    @IBOutlet weak var recipeImage: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
