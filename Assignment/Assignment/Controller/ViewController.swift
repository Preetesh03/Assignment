//
//  ViewController.swift
//  Assignment
//
//  Created by Pritesh on 22/06/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblValidationMessage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func btnLoginClicked(_ sender: UIButton) {
        if let email = txtEmail.text, let password = txtPassword.text{
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Please Enter valid Email Id!", alertStyle: .alert, actionTitles: ["Okay"], actionStyle: [.default], actions:  [{ _ in print("Okay Clicked")}])
                
            }else if !password.validatepassword(){
                openAlert(title: "Alert", message: "Please Enter Password! \n Password Length must range From 8-14 Characters.", alertStyle: .alert, actionTitles: ["Okay"], actionStyle: [.default], actions:  [{ _ in print("Okay Clicked")}])
                
            }else{
                
            }
            
        }else{
            openAlert(title: "Alert", message: "Please add Details", alertStyle: .alert, actionTitles: ["Okay"], actionStyle: [.default], actions:  [{ _ in print("Okay Clicked")}])
        }
            
            
            
        }
    
    
}

class ViewController1: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        tblView.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        
        tblView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        viewModelUser.vc = self
        viewModelUser.getAllUserDataAF()
    }
}

extension ViewController1: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        let modelUser = viewModelUser.arrUsers[indexPath.row]
        if let id = modelUser.id{
            cell?.lblID.text = "\(id)"
        }else{
            cell?.lblID.text = " NO ID"
        }
//        cell?.lblID.text = "\(modelUser.id)"
        cell?.lblTitle.text = modelUser.title
        return cell!
    }
    
}


