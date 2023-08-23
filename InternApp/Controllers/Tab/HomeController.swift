//
//  HomeController.swift
//  Apptern
//
//  Created by mert Kanak on 2.08.2023.
//

import UIKit

class HomeController: UIViewController {
    // MARK: - TODO
    /**
     Workbooka çevir
     cardtan gelen kelimeleri cell içinde anlamlarıyla birlikte göster
     workbook kelimelerini gptye yolla text versin 
     */

    
    // MARK: - UI Components
   
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.text = "Your Total Point is :"
        label.numberOfLines = 2
        return label
    }()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        self.view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
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
