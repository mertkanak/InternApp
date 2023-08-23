//
//  GPTController.swift
//  InternApp
//
//  Created by mert Kanak on 10.08.2023.
// api key = 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

import UIKit
import SwiftUI

class GPTController: UIViewController {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    
    let hostingController = UIHostingController(rootView: ChatBotView())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupUI()
    
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

    
    
    
    
    
    
    
    
}
