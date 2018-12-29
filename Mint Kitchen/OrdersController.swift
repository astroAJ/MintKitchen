//
//  OrdersController.swift
//  Mint Kitchen
//
//  Created by Macbook on 28/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit

class OrdersController: UIViewController {
    @IBOutlet weak var logLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.center = view.center
        logLabel.center.x = view.center.x
        logLabel.center.y = view.center.y-60
//        logLabel.frame = CGRect(x: view.center.x-logLabel.center.x, y: view.center.y-100, width: logLabel.bounds.width, height: logLabel.bounds.height)
        

        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: Any){
        
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
