//
//  ViewController.swift
//  Awift6BMIApp
//
//  Created by HiroakiSaito on 2021/09/02.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func done(_ sender: Any) {
        
        if textField.text?.isEmpty != true && heightField.text?.isEmpty != true{
            
            Auth.auth().signInAnonymously { [self] (result,error) in
                
                if error != nil{
                    print(error.debugDescription)
                }else{
                    
                    UserDefaults.standard.setValue(self.textField.text, forKey: "userName")
                    UserDefaults.standard.setValue(self.heightField.text, forKey: "height")
                    
                    //画面遷移
                    let tabVC = self.storyboard?.instantiateViewController(identifier: "tabVC") as! TabViewController
                    
                    self.navigationController?.pushViewController(tabVC, animated: true)
                    
                }
                
            }
            
        }
        
    }
    

}

