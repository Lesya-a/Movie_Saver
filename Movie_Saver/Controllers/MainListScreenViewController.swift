import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    public let mainTableView: UITableView = UITableView()
    // MARK: Private
    private var moviesInfo: [MovieInfo] = []
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configNavigationBar()
        setupTableView()
        addConstraints()
        setupUI()
    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(mainTableView)
    }
    
    private func configNavigationBar() {
        self.title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonDidTapped))
    }
    
    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    private func setupUI() {
        //view
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        //mainTableView
        mainTableView.backgroundColor = view.backgroundColor
        mainTableView.separatorStyle = .none
        mainTableView.register(UINib(nibName: "TableViewCellListScreen", bundle: nil), forCellReuseIdentifier: "TableViewCellListScreen")
    }
    
    private func addConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 162).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18).isActive = true
    }
    
    // MARK: - Helpers
    @objc private func buttonDidTapped() {
        let addNewFilmScreenVC = AddNewFilmScreenViewController()
        addNewFilmScreenVC.delegate = self // !!!!
        navigationController?.pushViewController(addNewFilmScreenVC, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "TableViewCellListScreen", for: indexPath) as! TableViewCellListScreen
        
        cell.containerView.layer.cornerRadius = cell.containerView.frame.height / 2
        cell.imgView.image = moviesInfo[indexPath.row].imageMovie
        cell.labelView.text = moviesInfo[indexPath.row].name
        //cell.ratingMovieLabel.attributedText = ratingMovieInfo(indexPath)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let detailScreenViewController = DetailScreenViewController() as? DetailScreenViewController {
//            detailScreenViewController.modalPresentationStyle = .formSheet
//            detailScreenViewController.movieInfo = moviesInfo[indexPath.item]
//            navigationController?.pushViewController(detailScreenViewController, animated: true)
//        }
//    }
}

extension ViewController: TransferMovieBetweenVCDelegate {
    func transferMovieInfo(_ movieInfo: MovieInfo) {
        moviesInfo.append(movieInfo)
        mainTableView.reloadData()
    }
}
