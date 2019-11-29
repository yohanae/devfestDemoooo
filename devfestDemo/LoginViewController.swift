//
//  LoginViewController.swift
//  devfestDemo
//
//  Created by yohana Ermias on 11/20/19.
//  Copyright © 2019 yohana Ermias. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    let programaticSegue = ProgramaticSegueways()
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
      
       
       @IBAction func loginButton(_ sender: Any) {
       loginRegister()
       }
       
       
       func loginRegister() {
           guard let email = emailTextfield.text else { return }
           guard let password = passwordTextfield.text else { return}
           
           Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
               if error != nil{
                   //this is where we'll write our error alert
                   return
               }
               
               self.goToHomePage()
               
           })
       }
       
       
       func goToHomePage() {
            programaticSegue.segueTo(currentViewController: self, destinationViewController: "homeVC")
       }

       
       @IBAction func forgotPasswordButton(_ sender: Any) {
            programaticSegue.segueTo(currentViewController: self, destinationViewController: "forgotPasswordVC")
       }
       
       
       @IBAction func backButton(_ sender: Any) {
           programaticSegue.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
       }

}
