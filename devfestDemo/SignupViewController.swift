//
//  SignupViewController.swift
//  devfestDemo
//
//  Created by yohana Ermias on 11/20/19.
//  Copyright © 2019 yohana Ermias. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

   let programaticSegue = ProgramaticSegueways()
   let alert = Alerts()
      
      @IBOutlet weak var usernameTextfield: UITextField!
      @IBOutlet weak var emailTextfield: UITextField!
      @IBOutlet weak var passwordTextfield: UITextField!
      
      
      override func viewDidLoad() {
          super.viewDidLoad()
      
      }
      
      @IBAction func signupButton(_ sender: Any) {
          signupRegister()
      }
      
      
      
      func signupRegister () {
              guard let username = usernameTextfield.text else{ return }
              guard let email = emailTextfield.text else { return }
              guard let password = passwordTextfield.text else { return }
        
             Auth.auth().createUser(withEmail: email , password: password ,completion: { (result, error) in
                 if error != nil {
                   self.alert.showAlert(Title: "Something Went Wrong!", Message: "Please check your credential and try again", viewControllerToPresentAlert: self)
                    return
                 }
                 guard let uid = result?.user.uid else {return}
                
                
                 let values = ["name": username, "email": email]
                let ref = Database.database().reference(fromURL: "https://devfestdemo-4a152.firebaseio.com/" )
                let userReference = ref.child("user").child(uid)
                userReference.updateChildValues(values, withCompletionBlock: {
                    (err, ref) in
                    if err != nil {
                        self.alert.showAlert(Title: "Something Went Wrong!", Message: "Please check your internet connection and try again", viewControllerToPresentAlert: self)
                        return
                    }
                    
                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil{
                            self.alert.showAlert(Title: "Ooops!", Message: "Something went wrong", viewControllerToPresentAlert: self)
                            return
                        }
                        
                        self.goToHomePage()
                        
                    })
                })
           })
         }
         
      
    
   
    
    func goToHomePage() {
           programaticSegue.segueTo(currentViewController: self, destinationViewController: "homeVC")
      }

      
      @IBAction func backButton(_ sender: Any) {
           programaticSegue.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
      }
      
      
}
