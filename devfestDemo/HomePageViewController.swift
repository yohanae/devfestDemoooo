//
//  HomePageViewController.swift
//  devfestDemo
//
//  Created by yohana Ermias on 11/20/19.
//  Copyright © 2019 yohana Ermias. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController {

  
       let programaticSegue = ProgramaticSegueways()
    
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           checkIfUserIsLoggedIn()
       }
       

       
       func checkIfUserIsLoggedIn() {
           if Auth.auth().currentUser?.uid == nil {
                programaticSegue.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
           }
       }
       
       

       
       
       @IBAction func logoutButton(_ sender: Any) {
           do {
               try Auth.auth().signOut()
           } catch _ as NSError {
               //if there is an error while logging out we will present our alert here
           }
           if Auth.auth().currentUser?.uid == nil {
                programaticSegue.segueTo(currentViewController: self, destinationViewController: "signupOrLoginVC")
           }
       }

}
