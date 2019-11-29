//
//  SignupOrLoginViewController.swift
//  devfestDemo
//
//  Created by yohana Ermias on 11/20/19.
//  Copyright © 2019 yohana Ermias. All rights reserved.
//

import UIKit

class SignupOrLoginViewController: UIViewController {

    let programaticSegue = ProgramaticSegueways()
       
       
       override func viewDidLoad() {
           super.viewDidLoad()
       }
       
       @IBAction func goToSignupPageButton(_ sender: Any) {
           programaticSegue.segueTo(currentViewController: self, destinationViewController: "signupVC")
       }
       
       
       @IBAction func goToLoginPageButton(_ sender: Any) {
           programaticSegue.segueTo(currentViewController: self, destinationViewController: "loginVC")
       }
       
    
    

}
