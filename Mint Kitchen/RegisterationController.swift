//
//  RegisterationController.swift
//  Mint Kitchen
//
//  Created by Macbook on 21/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class RegisterationController: UIViewController, UITextFieldDelegate
{
    
    let registerationURL = "http://139.59.43.53:5000/api/user/create"
   
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        emailTextField.delegate = self
        nameTextField.delegate = self
        mobileTextField.delegate = self
        passwordTextField.delegate = self
        
       
        emailTextField.frame = CGRect(x: 16 , y: (view.frame.height/2)-208, width: view.frame.width-32, height: 40)
        
       
        nameTextField.frame = CGRect(x: 16 , y: (view.frame.height/2)-152, width: view.frame.width-32, height: 40)
        
       
        mobileTextField.frame = CGRect(x: 16 , y: (view.frame.height/2)-96, width: view.frame.width-32, height: 40)
        
        
        
        passwordTextField.frame = CGRect(x: 16 , y: view.frame.height/2-40, width: view.frame.width-32, height: 40)
        
        
        
        cancelButton.frame = CGRect(x: 16, y: view.frame.height-66, width: view.frame.width-32, height: 50)
        registerButton.frame = CGRect(x: 16, y: view.frame.height-132
            , width: view.frame.width-32, height: 50)
        

        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (viewTapped))
        
        self.view.addGestureRecognizer(tapGesture)
    }

    @IBAction func registerButtonPressed(_ sender: Any)
    {
    
        
        let params : [String : String] = ["email" : emailTextField.text!, "username" : nameTextField.text!,"password": passwordTextField.text! ,"telno": mobileTextField.text!]
        
        
        SVProgressHUD.show()
        
        Alamofire.request(registerationURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON{
            response in
            
            if response.result.isSuccess
            {
                SVProgressHUD.dismiss()
                
                print(response)
                
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let TabController = storyboard.instantiateViewController(withIdentifier: "tabID") as! UITabBarController
                
                //            let app = UIApplication.shared.delegate as! AppDelegate
                //            app.window!.rootViewController = diallerTBC
                //            app.window?.makeKeyAndVisible()
                self.present(TabController, animated: true, completion: nil)
            }
            else
            {
                print("registeration failed")
                
                if response.result.description == "Email is already used."
                {
                    self.dismiss(animated: true, completion: nil)
                }
            }
                
                
        }
        
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any)
    {
    dismiss(animated: true, completion: nil)
    }
    
    // UITextFieldDelegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        
        if textField == emailTextField
        {
           if isValidEmail(testStr: emailTextField.text!) == false
           {
            let alert = UIAlertController(title: "Alert", message: "Invalid email", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // to checck email format  //
    
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @objc func viewTapped() {
        mobileTextField.endEditing(true)
        passwordTextField.endEditing(true)
        emailTextField.endEditing(true)
        nameTextField.endEditing(true)
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
