import UIKit

final class YourRatingPickerScreenViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate:TransferDataBetweenVCDelegate?
    // MARK: Private
    private let label: UILabel = UILabel()
    private let pickerView: UIPickerView = UIPickerView()
    private let button: UIButton = UIButton()
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
        
        self.navigationItem.hidesBackButton = false
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(pickerView)
        view.addSubview(button)
    }
    private func setupUI() {
        view.backgroundColor = .white
        //label
        label.text = "Your Rating"
        label.font = UIFont(name: "manropeMedium", size: 24)
        label.textAlignment = .center
        //pickerView
        //button
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    private func addConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.32).isActive = true
        
        pickerView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        pickerView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        button.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 42).isActive = true
        
    }
    
    // MARK: - Helpers
    private func fillArray() -> [Double] {
        return Array(stride(from: 0.0, to: 10.1, by: 0.1)).reversed()
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
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayRaiting.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "%.1f", arrayRaiting[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rating = String(format: "%.1f", arrayRaiting[row])//String(arrayRaiting[row])
    }
}
