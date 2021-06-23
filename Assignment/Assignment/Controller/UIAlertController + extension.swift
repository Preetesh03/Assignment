//
//  UIAlertController + extension.swift
//  Assignment
//
//  Created by Pritesh on 22/06/21.
//

import Foundation
import UIKit

extension UIViewController {
       func openAlert(title: String?,
                       message: String?,
                       alertStyle:UIAlertController.Style,
                       actionTitles:[String?],
                       actionStyle:[UIAlertAction.Style],
                       actions:[((UIAlertAction) -> Void)?]){
              let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
              for (index, indexTitle) in actionTitles.enumerated() {
                   let action = UIAlertAction(title: indexTitle, style: actionStyle[index], handler: actions[index])
                   alert.addAction(action)
              }
              self.present(alert, animated: true)
         }
    }
