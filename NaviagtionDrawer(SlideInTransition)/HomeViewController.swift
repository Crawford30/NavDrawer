//
//  HomeViewController.swift
//  NaviagtionDrawer(SlideInTransition)
//
//  Created by JOEL CRAWFORD on 2/5/20.
//  Copyright © 2020 JOEL CRAWFORD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //===creating property for the transition
    let transition = SlideInTransition()
    
    //=====call refernce to the top view to remove a view after one has been selected==
    var topView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func menu_icon_tapped(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") as? MenuViewController else { return }
        //set the closure to change==
        menuViewController.didTapMenuType = { menuType in
            self.TransitionnToNew(menuType)
        
        }
        
        menuViewController.modalPresentationStyle = .overCurrentContext
        //setting delegate for the VC===
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true, completion: nil)
    }
    
    
    //====function to transition to Newcontent===
    func TransitionnToNew(_ menuType: MenuType) {
        //===first update title==
        let title = String(describing: menuType).capitalized
        self.title = title
        //====tell topview to remove itself from the supper view==
        
        topView?.removeFromSuperview()
        //====after we chnage the content === we can use subview
        
        switch menuType {
        case .profile:
//            //=====create view===
//            let view = UIView()
//            view.backgroundColor = .red
//            view.frame = self.view.bounds //fitting a view
//            self.view.addSubview(view)
//            //=====call it top
//            self.topVew = view
            let view = UIView()
            view.backgroundColor = .yellow
            view.frame = self.view.bounds
            self.view.addSubview(view)
            self.topView = view
            
        case .camera:
            //=====create view===
            let view = UIView()
            view.backgroundColor = .blue
            view.frame = self.view.bounds
            self.view.addSubview(view)
            
            //=====call it top
            self.topView = view
            
        default:
            break
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


extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //===telling transition whether we are presenting
        transition.isPresenting = true
        return transition
    }
    //===for dismisal==
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //===telling transition whether we are dismissing
        transition.isPresenting = false
        return transition
    }
    
    
}
