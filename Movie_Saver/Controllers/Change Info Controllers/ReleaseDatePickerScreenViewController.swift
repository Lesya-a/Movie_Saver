import UIKit

final class ReleaseDatePickerScreenViewController: UIViewController {
 
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferDataBetweenVCDelegate?
    // MARK: Private
    private let label: UILabel = UILabel()
    private let datePickerView: UIDatePicker = UIDatePicker()
    private let button: UIButton = UIButton()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
        
        self.navigationItem.hidesBackButton = false
        navigationController?.navigationBar.prefersLargeTitles = false


        datePickerView.datePickerMode = .date
        datePickerView.timeZone = .autoupdatingCurrent
        datePickerView.preferredDatePickerStyle = .wheels

    }
    
    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(datePickerView)
        view.addSubview(button)
    }
    private func setupUI() {
        view.backgroundColor = .white
        //label
        label.text = "Release Date"
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
        datePickerView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 124).isActive = true
        label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.32).isActive = true
        
        datePickerView.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        datePickerView.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
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

