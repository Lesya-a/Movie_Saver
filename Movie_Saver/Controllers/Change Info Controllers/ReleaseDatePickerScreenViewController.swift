import UIKit

final class ReleaseDatePickerScreenViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let label = UILabel()
    private let datePickerView = UIDatePicker()
    private let button = UIButton()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
        configDatePicerView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    // MARK: - Setups
    private func configNavigationBar() {
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func configDatePicerView() {
        datePickerView.datePickerMode = .date
        datePickerView.timeZone = .autoupdatingCurrent
        datePickerView.preferredDatePickerStyle = .wheels
    }

    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(datePickerView)
        view.addSubview(button)
    }

    private func setupUI() {
        viewSetup()
        labelSetup()
        buttonSetup()
    }
    private func viewSetup() {
        view.backgroundColor = .white
    }
    private func labelSetup() {
        label.text = "Release Date"
        label.font = .manrope(ofSize: 24, weight: .medium)
        label.textAlignment = .center
    }
    private func buttonSetup() {
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private func addConstraints() {
        labelConstraints()
        datePickerViewConstraints()
        buttonConstraints()
    }

    private func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }

    private func datePickerViewConstraints() {
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        datePickerView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        datePickerView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: datePickerView.bottomAnchor, constant: 42).isActive = true
    }

    // MARK: - Helpers
    @objc private func buttonTapped() {
        let date = datePickerView.date
        delegate?.transferMovieDate(date)
        navigationController?.popViewController(animated: true)
    }
}
