//
//  MenuViewController.swift
//  NaviagtionDrawer(SlideInTransition)
//
//  Created by JOEL CRAWFORD on 2/5/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit
//creating enum for aech of the menu item
enum MenuType: Int {
    case home
    case camera
    case profile
    case sign_up
    case login
    case settings
    
}

class MenuViewController: UITableViewController {
    //====adding a closure to update menu===
    var didTapMenuType: ((MenuType) -> Void)? //closure

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in //adding capsilic to avoid retain cycle
            print("Dismissing: \(menuType)")
            //=====presenting===
            self?.didTapMenuType?(menuType)
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
