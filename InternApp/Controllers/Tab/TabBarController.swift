//
//  TabBarController.swift
//  InternApp
//
//  Created by mert Kanak on 10.08.2023.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    // MARK: - UI Components
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - UI Setup
    
    // MARK: - Tab Setup
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let workbook = self.createNav(with: "WorkBook", and: UIImage(systemName: "character.book.closed"), vc: CardTableViewController())
        let card = self.createNav(with: "Cards", and: UIImage(systemName: "lanyardcard"), vc: CardController())
        let gpt = self.createNav(with: "GPT", and: UIImage(systemName: "person"), vc: GPTController())
        
        self.setViewControllers([home, workbook, card, gpt], animated: true)
        
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        nav.viewControllers.first?.navigationItem.title = title
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
    
    @objc func openSwiftUIScreen() {
        let swiftUIViewController = UIHostingController(rootView: ChatBotView())
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }
}

extension UITabBarController {
    func getViewController<T: UIViewController>(ofType type: T.Type) -> T? {
        for viewController in viewControllers ?? [] {
            if let desiredViewController = viewController as? T {
                return desiredViewController
            }
        }
        return nil
    }
}
