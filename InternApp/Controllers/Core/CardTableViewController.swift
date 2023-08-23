
import UIKit

class CardTableViewController: UIViewController  {
    
    var addedWordPairs: [WordPair]?
    //
    //    init(addedWordPairs: [WordPair]) {
    //        self.addedWordPairs = addedWordPairs
    //        super.init(nibName: nil, bundle: nil) // Üst sınıfın başlatıcısını çağır
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .black
        return tableView
    }()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupUI()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell") // Register the cell
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(didTapReloadButton))
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    // MARK: - Selectors
    
    @objc func didTapReloadButton() {
        self.tableView.reloadData()
        //print("\(addedWordPairs?)")
    }
}

extension CardTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addedWordPairs?.count ?? 0 // Return the count of addedWordPairs
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let wordPair = addedWordPairs?[indexPath.row]
        cell.textLabel?.text = "\(wordPair?.english ?? "") - \(wordPair?.meaning ?? "")"
        return cell
    }
}


