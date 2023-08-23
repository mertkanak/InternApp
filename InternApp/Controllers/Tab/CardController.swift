//
//  CardController.swift
//  InternApp
//
//  Created by mert Kanak on 10.08.2023.
//

import UIKit

class CardController: UIViewController {
    // MARK: - UI Components
    //var wordsApi = WordAPIService()
    
    private let nextButton = CustomButton(title: "Next", hasBackground: true, fontSize: .small)
    private let addButton = CustomButton(title: "Add to Workbook", hasBackground: true, fontSize: .small)
    
    private let cardView: UIView = {
        let cv = UIView()
        cv.backgroundColor = UIColor.gray
        cv.layer.cornerRadius = 10.0
        cv.layer.borderWidth = 1.0
        cv.layer.borderColor = UIColor.gray.cgColor
        return cv
    }()
    
    private let frontLabel: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private let backLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    
    let wordPairs: [WordPair] = [
        WordPair(english: "After", meaning: "Sonra"),
        WordPair(english: "Agreed", meaning: "Anlaşıldı"),
        WordPair(english: "Zap", meaning: "Vurmak"),
        WordPair(english: "Age", meaning: "Yaş"),
        WordPair(english: "Law", meaning: "Yasa"),
        WordPair(english: "Bond", meaning: "Bağ")
    ]
    
    var addedWordPairs: [WordPair] = []
    
    var currentIndex = 0
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(flipCard))
        cardView.addGestureRecognizer(tapGesture)
        self.nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        self.addButton.addTarget(self, action: #selector(didTapAddToWorkbookButton), for: .touchUpInside)
        //wordsApi.sendRequest()
        self.updateLabels()
        self.setupUI()
    }
    
    private func updateLabels() {
        let currentWordPair = wordPairs[currentIndex]
        frontLabel.text = currentWordPair.english
        backLabel.text = currentWordPair.meaning
    }
    
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(cardView)
        self.cardView.addSubview(frontLabel)
        self.cardView.addSubview(backLabel)
        self.view.addSubview(nextButton)
        self.view.addSubview(addButton)
        self.view.addSubview(infoLabel)
        
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        frontLabel.translatesAutoresizingMaskIntoConstraints = false
        backLabel.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            self.cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -55),
            self.cardView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.50),
            self.cardView.widthAnchor.constraint(equalToConstant: 250),
            
            self.frontLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            self.frontLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            
            self.backLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            self.backLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            self.backLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            self.backLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            
            self.infoLabel.topAnchor.constraint(equalTo: frontLabel.bottomAnchor, constant: 12),
            //self.infoLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            //self.infoLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            self.infoLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 8),
            self.infoLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -8),
            
            self.nextButton.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 22),
            self.nextButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.nextButton.heightAnchor.constraint(equalToConstant: 55),
            self.nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55),
            
            self.addButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 22),
            self.addButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.addButton.heightAnchor.constraint(equalToConstant: 55),
            self.addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.55),
        ])
    }
    
    // MARK: - Selectors
    
    @objc func flipCard() {
        UIView.transition(with: cardView, duration: 0.5, options: .transitionFlipFromRight, animations: {
            if self.frontLabel.isHidden {
                self.frontLabel.isHidden = false
                self.backLabel.isHidden = true
            } else {
                self.frontLabel.isHidden = true
                self.backLabel.isHidden = false
            }
        }, completion: nil)
    }
    
    @objc private func didTapNextButton() {
        
        print("Didtapnextbutton")
        
        if currentIndex < wordPairs.count - 1 {
            currentIndex += 1
            updateLabels()
        } else {
            frontLabel.isHidden = true
            backLabel.isHidden = true
            infoLabel.isHidden = false
            infoLabel.text = "No more free cards for today!"
        }
        
        frontLabel.isHidden = false
        backLabel.isHidden = true
        
    }
    
    @objc func didTapAddToWorkbookButton() {
        let navController = self.tabBarController?.viewControllers![1] as! UINavigationController
        let vc = navController.topViewController as! CardTableViewController
        if !addedWordPairs.contains(where: { wordPair in
            wordPair.english == wordPairs[currentIndex].english && wordPair.meaning == wordPairs[currentIndex].meaning
        }) {
            addedWordPairs.append(wordPairs[currentIndex])
            vc.addedWordPairs = addedWordPairs
        }
    }
}
