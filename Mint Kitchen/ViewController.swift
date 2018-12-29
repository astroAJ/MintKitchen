//
//  ViewController.swift
//  Mint Kitchen
//
//  Created by Macbook on 19/12/18.
//  Copyright © 2018 Macbook. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Alamofire

class ViewController: UIViewController, FBSDKLoginButtonDelegate, UITextFieldDelegate
{
    // global variables
    
    let loginURL = "http://139.59.43.53:5000/api/login"
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        // FB login Button  //
        
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email", "user_friends"]
        loginButton.delegate = self
        // Optional: Place the button in the center of your view.
        loginButton.frame = CGRect(x: 16, y: view.frame.height-loginButton.frame.height-100, width: view.frame.width-32, height: 50)
        view.addSubview(loginButton)
        
        
        // Delegation //
        
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        // UI Allignment //
        
        self.registerButton.frame = CGRect(x: 16, y: view.frame.height-self.registerButton.frame.height-160, width: view.frame.width-32, height: 50)
        
        self.loginButton.frame = CGRect(x: 16, y: view.frame.height/2, width: view.frame.width-32, height: 50)
        self.passwordTextField.frame = CGRect(x: 16, y: view.frame.height/2-50, width: view.frame.width-32, height: 40)
        self.emailTextField.frame = CGRect(x: 16, y: view.frame.height/2-100, width: view.frame.width-32, height: 40)
        
        
        if (FBSDKAccessToken.current() != nil)
        {
            // User is logged in, do work such as go to next view controller.
            print("logged in")
        }
        else
        {
            print("not logged in")
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector (viewTapped))
        
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        
    }
    
    /*  FBSDKLoginButtonDelegate Delegate Methods */
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!)
    {
        
        if error != nil
        {
            print("some error: \(error.localizedDescription)")
//            return
        }
        else if result.isCancelled
        {
            print("user cancelled")
        }
        else
        {
         print("user logged in")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!)
    {
        print("Logged out")
        
    }
    
    @IBAction func loginButtonPressed(_ sender: Any)
    {
        
//        
//            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//            let diallerTBC = storyboard.instantiateViewController(withIdentifier: "tabID") as! UITabBarController
//            self.present(diallerTBC, animated: true, completion: nil)
    
        
        Alamofire.request(loginURL, method: .post, parameters: ["email":emailTextField.text!,"password":passwordTextField.text!], encoding: JSONEncoding.default, headers: nil).responseJSON{
            response in

            if response.result.isSuccess
            {
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let diallerTBC = storyboard.instantiateViewController(withIdentifier: "tabID") as! UITabBarController
                self.present(diallerTBC, animated: true, completion: nil)
                print(response.description)
            }
            else
            {


            }

            let alert = UIAlertController(title: "Alert", message: "Invalid Credential", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        
        
        
    }
    
    @IBAction func registerButtonPressed(_ sender: Any)
    {
        
    }
    
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func viewTapped() {
        passwordTextField.endEditing(true)
        emailTextField.endEditing(true)
    }


}

