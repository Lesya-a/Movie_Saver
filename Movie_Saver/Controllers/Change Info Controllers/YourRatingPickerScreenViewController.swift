import UIKit

final class YourRatingPickerScreenViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let label = UILabel()
    private let pickerView = UIPickerView()
    private let button = UIButton()
    private var arrayRaiting: [Double] = []
    private var rating: String?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
        pickerView.delegate = self
        pickerView.dataSource = self
        arrayRaiting = fillArray()
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

    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(pickerView)
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
        label.text = "Your Rating"
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
        pickerViewConstraints()
        buttonConstraints()
    }

    private func labelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.32).isActive = true
    }

    private func pickerViewConstraints() {
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    private func buttonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 42).isActive = true
    }

    // MARK: - Helpers
    private func fillArray() -> [Double] {
        Array(stride(from: 0.0, to: 10.1, by: 0.1)).reversed()
    }

    @objc private func buttonTapped() {
        if rating != nil {
            delegate?.transferMovieRating(rating!)
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Select rating movie!")
        }
    }

    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension YourRatingPickerScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        arrayRaiting.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(format: "%.1f", arrayRaiting[row])
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = String(format: "%.1f", arrayRaiting[row])
    }
}
