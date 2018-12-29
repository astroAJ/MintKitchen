//
//  RecipeController.swift
//  Mint Kitchen
//
//  Created by Macbook on 21/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import PullUpController

class RecipeController: UITableViewController,ExpandableHeaderViewDelegate
{
   
    
    var data = [Section(recipeCategory : "Soups",recipies: ["Chicken Soup","Vegetable Soup","Mutton Soup"],isExpanded : false), Section( recipeCategory :"Biriyani",recipies :["Chicken Biriyani","Mutton Biriyani","Beef Biriyani","Prawn Biriyani","Fish Biriyani"],isExpanded :false),Section( recipeCategory:"Starters", recipies : ["Chicken Lolipop","chilli chicken","peper Masala"],isExpanded : false)]

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "Product", bundle: nil) , forCellReuseIdentifier: "recipe")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.edgesForExtendedLayout = []
        self.extendedLayoutIncludesOpaqueBars = false
        self.automaticallyAdjustsScrollViewInsets = false
  
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        
        print(data.count)
        
        return data.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        
        
        return data[section].recipies.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if data[indexPath.section].isExpanded
        {
            return 160
        }
        else
        {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let header = ExpandableHeaderView()
        header.customInit(title: data[section].recipeCategory, section: section, delegate: self)
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipe", for: indexPath)
            as! RecipeCell
        
        var edge : CGFloat = self.view.frame.width/4
        
        cell.recipeImage.frame = CGRect(x: self.view.frame.width-12-100, y: 12, width: 100, height: 100)
        
        // Configure the cell...
        
        cell.recipeImage.image = UIImage(named: "recipeSample.png")
        cell.recipeType.image = UIImage(named: "nonveg.jpg")
        
        cell.recipeName.text = data[indexPath.section].recipies[indexPath.row]
        
//        cell.recipeName.text = data[indexPath.section].recipies[indexPath.row]
//        cell.recipeImage.image = UIImage.init(named: "")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
//       addBottomView()
    }
    
    func addBottomView()
    {
        let pullUpController: CounterController = UIStoryboard(name: "Main",bundle: nil).instantiateViewController(withIdentifier: "counterVC") as! CounterController
        
        self.addChildViewController(pullUpController)
        self.view.addSubview(pullUpController.view)
        pullUpController.didMove(toParentViewController: self)
        
        let height = view.frame.height
        let width  = view.frame.width
        pullUpController.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
       
        
    }
    
    func toggleSection(header: ExpandableHeaderView, section: Int) {
        
        data[section].isExpanded = !data[section].isExpanded
        
        for i in 0 ..< data[section].recipies.count
        {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
            
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
