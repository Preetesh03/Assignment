//
//  UserViewModel.swift
//  Assignment
//
//  Created by Pritesh on 22/06/21.
//

import UIKit
import Alamofire

class UserViewModel{
    
    weak var vc: ViewController1?
    var arrUsers = [UserModel]()
    
    func getAllUserDataAF(){
        AF.request("https://jsonplaceholder.typicode.com/posts")
            .response
        {
            response in
                if let data = response.data {
                    do{
                        let userResponse = try
                            JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                        
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
        }
        
    }
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/posts")!){(data , response, error)
            in
            if error == nil {
                if let data = data {
                    do{
                        let userResponse = try
                            JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            self.vc?.tblView.reloadData()
                        }
                        
                    }catch let err{
                        print(err.localizedDescription)
                    }
                }
                
            }else{
                print(error?.localizedDescription)
            }
            
        }.resume()
    }
}
