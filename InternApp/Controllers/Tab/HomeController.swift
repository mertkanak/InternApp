//
//  HomeController.swift
//  Apptern
//
//  Created by mert Kanak on 2.08.2023.
//

import UIKit
import SwiftUI

class HomeController: UIViewController {
    // MARK: - TODO
    /**
     Workbooka çevir
     cardtan gelen kelimeleri cell içinde anlamlarıyla birlikte göster
     workbook kelimelerini gptye yolla text versin
     */
    
    // MARK: - UI Components
    let hostingController = UIHostingController(rootView: HomeView())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    
    // MARK: - Selectors
    
    @objc private func didTapLogout() {
        let vc = LoginController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: false, completion: nil)
    }
}
