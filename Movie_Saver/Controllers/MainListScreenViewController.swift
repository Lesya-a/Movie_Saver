import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    public let mainTableView = UITableView()
    // MARK: Private
    private var moviesInfo: [MovieInfo] = []
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupTableView()
        addConstraints()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(mainTableView)
    }

    private func configNavigationBar() {
        title = "My Movie List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(buttonDidTapped)
        )
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: nil,
            action: nil
        )
    }

    private func setupTableView() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

    private func setupUI() {
        viewUI()
        mainTableViewUI()
    }

    private func viewUI() {
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
    }

    private func mainTableViewUI() {
        mainTableView.backgroundColor = view.backgroundColor
        mainTableView.separatorStyle = .none
        mainTableView.register(
            UINib(nibName: "TableViewCellListScreen", bundle: nil), forCellReuseIdentifier: "TableViewCellListScreen"
        )
    }

    private func addConstraints() {
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 162).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
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
        moviesInfo.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        212
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainTableView.dequeueReusableCell(
            withIdentifier: "TableViewCellListScreen", for: indexPath
        ) as? TableViewCellListScreen {
            cell.imgView.image = moviesInfo[indexPath.row].imageMovie
            cell.textView.text = moviesInfo[indexPath.row].name
            cell.ratingLabel.attributedText = ratingMovieInfo(indexPath)
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailScreenViewController = DetailScreenViewController()
        detailScreenViewController.modalPresentationStyle = .formSheet
        detailScreenViewController.movieInfo = moviesInfo[indexPath.item]
        navigationController?.pushViewController(detailScreenViewController, animated: true)
    }

    private func ratingMovieInfo(_ indexPath: IndexPath) -> NSMutableAttributedString {
        let firstAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.manrope(ofSize: 18, weight: .bold)
        ]
        let secondAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
            NSAttributedString.Key.font: UIFont.manrope(ofSize: 18, weight: .regular)
        ]

        let firstString =
            NSMutableAttributedString(string: "\(moviesInfo[indexPath.row].rating)", attributes: firstAttributes)
        let secondString =
            NSAttributedString(string: "/10", attributes: secondAttributes)
        firstString.append(secondString)

        return firstString
    }
}

extension ViewController: TransferMovieBetweenVCDelegate {
    func transferMovieInfo(_ movieInfo: MovieInfo) {
        moviesInfo.append(movieInfo)
        mainTableView.reloadData()
    }
}
