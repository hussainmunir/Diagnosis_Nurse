//
//  NurseTabVC.swift
//  DiagnosisNurse
//
//  Created by YamTech on 05/04/2022.
//

import UIKit

class NurseTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 15, *) {
                    let tabBarAppearance = UITabBarAppearance()
                    tabBarAppearance.backgroundColor = Color2
                    tabBar.unselectedItemTintColor = .black
                    tabBar.standardAppearance = tabBarAppearance
                    tabBar.scrollEdgeAppearance = tabBarAppearance
                } else {
                    tabBar.barTintColor = Color2
                    tabBar.unselectedItemTintColor = .black
                }
        
        setUpTabbar()
    }
    
    func setUpTabbar() {
        let view1 = UINavigationController(rootViewController: NurseDashboardVC())//home
//        view1.tabBarItem.image = UIImage(named: "icons8-home-24")
        view1.tabBarItem.title = "Home"
        let view2 = UINavigationController(rootViewController: WaitingListVC())
//        view2.tabBarItem.image = UIImage(named: "icons8-envelope-24")
        view2.tabBarItem.title = "Messenger"
        let view3 = UINavigationController(rootViewController: XRayWaitingListVC())
//        view3.tabBarItem.image = UIImage(named: "icons8-notification-24")
        view3.tabBarItem.title = "Notifications"
//        let view4 = UINavigationController(rootViewController: ProfileVC())
//        view4.tabBarItem.image = UIImage(named: "icons8-female-profile-24")
//        view4.tabBarItem.title = "Profile"
        viewControllers = [view1,view2,view3]
        
    }

}
