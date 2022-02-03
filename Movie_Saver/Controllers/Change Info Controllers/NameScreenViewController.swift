import UIKit

final class NameScreenViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let label = UILabel()
    private let textField = UITextField()
    private let underlineView = UIView()
    private let button = UIButton()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        addConstraints()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textField.becomeFirstResponder()
    }

    // MARK: - Setups
    private func configNavigationBar() {
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(underlineView)
        view.addSubview(button)
    }

    // MARK: SetupUI
    private func setupUI() {
        view.backgroundColor = .white
        labelSetup()
        textFieldSetup()
        underlineViewSetup()
        buttonSetup()
    }

    private func labelSetup() {
        label.text = "Film Name"
        label.textAlignment = .center
        label.font = .manrope(ofSize: 24, weight: .medium)
    }

    private func textFieldSetup() {
        textField.placeholder = "Name"
        textField.backgroundColor = .white
    }

    private func underlineViewSetup() {
        underlineView.backgroundColor = .lightGray
    }

    private func buttonSetup() {
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    // MARK: Constrains
    private func addConstraints() {
        labelConstraints()
        textFieldConstraints()
        underlineViewConstraints()
        buttonConstraints()
    }

    private func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.32).isActive = true
    }

    private func textFieldConstraints() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
    }

    private func underlineViewConstraints() {
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        underlineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        underlineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        underlineView.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
    }

    private func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 42).isActive = true
    }

    // MARK: - Helpers
    @objc private func buttonTapped() {
        if textField.text != "" {
            let name = textField.text ?? ""
            delegate?.transferMovieName(name)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill name movie!")
        }
    }

    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        }))
        present(alert, animated: true, completion: nil)
    }
}
