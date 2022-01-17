import UIKit

protocol TransferDataBetweenVCDelegate: AnyObject {
    func transferMovieName(_ name: String)
    func transferMovieRating(_ rating: String)
    func transferMovieDate(_ date: Date)
    func transferMovieYouTube(_ url: URL)
}

final class AddNewFilmScreenViewController: UIViewController {
    // MARK: - Properties
    // MARK: Public
    weak var delegate: TransferMovieBetweenVCDelegate?
    // MARK: Private
    
    private var pickedImage: UIImage?
    private var movieInfo: MovieInfo = MovieInfo()
    private let imgViewContainer: UIView = UIView()
    private let imgView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "imgImage.png"))
    
    private let verticalStackView: UIStackView = UIStackView()
    private let gorizontalStackView1: UIStackView = UIStackView()
    private let ch1: UIView = UIView()
    private let nameLabel: UILabel = UILabel()
    private let dash1: UILabel = UILabel()
    private let nameChangeButton: UIButton = UIButton()
    
    private let ch2: UIView = UIView()
    private let raitingLabel: UILabel = UILabel()
    private let dash2: UILabel = UILabel()
    private let raitingChangeButton: UIButton = UIButton()
    
    private let gorizontalStackView2: UIStackView = UIStackView()
    private let ch3: UIView = UIView()
    private let releaseDateLabel: UILabel = UILabel()
    private let dash3: UILabel = UILabel()
    private let releaseDateChangeButton: UIButton = UIButton()
    
    private let ch4: UIView = UIView()
    private let linkLabel: UILabel = UILabel()
    private let dash4: UILabel = UILabel()
    private let linkButton: UIButton = UIButton()
    
    private let descriptionContainer: UIView = UIView()
    private let descriptionLabel: UILabel = UILabel()
    private let descriptionTextView: UITextView = UITextView()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        addSubviews()
        setupUI()
        addConstraints()
        addStackViews()
        tappedImage()
    }
    
    // MARK: - Setups
    private func configNavigationBar() {
        self.title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesBackButton = true
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    private func addSubviews() {
        view.addSubview(imgViewContainer)
        view.addSubview(imgView)
        view.addSubview(verticalStackView)
        view.addSubview(gorizontalStackView1)
        view.addSubview(ch1)
        view.addSubview(nameLabel)
        view.addSubview(dash1)
        view.addSubview(nameChangeButton)
        view.addSubview(ch2)
        view.addSubview(raitingLabel)
        view.addSubview(dash2)
        view.addSubview(raitingChangeButton)
        view.addSubview(gorizontalStackView2)
        view.addSubview(ch3)
        view.addSubview(releaseDateLabel)
        view.addSubview(dash3)
        view.addSubview(releaseDateChangeButton)
        view.addSubview(ch4)
        view.addSubview(linkLabel)
        view.addSubview(dash4)
        view.addSubview(linkButton)
        view.addSubview(descriptionContainer)
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionTextView)
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        // imgViewContainer
        imgViewContainer.backgroundColor = .white
        // imgView
        
        // verticalStackView
        verticalStackView.backgroundColor = .white
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
        
        // gorizontalStackView1
        gorizontalStackView1.backgroundColor = .white
        gorizontalStackView1.axis = .horizontal
        gorizontalStackView1.distribution = .fillEqually
        gorizontalStackView1.spacing = 10
        // ch1
        // nameLabel
        nameLabel.text = "Name"
        nameLabel.textAlignment = .center
        // dash1
        dash1.text = "-"
        // nameChangeButton
        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        nameChangeButton.addTarget(self, action: #selector(nameChangeButtonTapped), for: .touchUpInside)
        
        // ch2
        // raitingLabel
        raitingLabel.text = "Your Rating"
        raitingLabel.textAlignment = .center
        // dash2
        dash2.text = "-"
        // raitingChangeButton
        raitingChangeButton.setTitle("Change", for: .normal)
        raitingChangeButton.setTitleColor(.systemBlue, for: .normal)
        raitingChangeButton.addTarget(self, action: #selector(raitingChangeButtonTapped), for: .touchUpInside)
        
        // gorizontalStackView2
        gorizontalStackView2.backgroundColor = .white
        gorizontalStackView2.axis = .horizontal
        gorizontalStackView2.distribution = .fillEqually
        gorizontalStackView2.spacing = 10
        // ch3
        // releaseDateLabel
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textAlignment = .center
        // dash3
        dash3.text = "-"
        // releaseDateChangeButton
        releaseDateChangeButton.setTitle("Change", for: .normal)
        releaseDateChangeButton.setTitleColor(.systemBlue, for: .normal)
        releaseDateChangeButton.addTarget(self, action: #selector(releaseDateChangeButtonTapped), for: .touchUpInside)
        
        // ch4
        // linkLabel
        linkLabel.text = "YouTube Link"
        linkLabel.textAlignment = .center
        // dash4
        dash4.text = "-"
        // linkButton
        linkButton.setTitle("Change", for: .normal)
        linkButton.setTitleColor(.systemBlue, for: .normal)
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        
        // descriptionContainer
        descriptionContainer.backgroundColor = .white
        // descriptionLabel
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont(name: "manropeMedium", size: 18)
        descriptionLabel.textAlignment = .center
        // descriptionTextView
        descriptionTextView.text = ""
        descriptionTextView.font = UIFont(name: "manropeMedium", size: 14)
    }
    
    private func tappedImage() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func nameChangeButtonTapped() {
     let nameScreenViewController = NameScreenViewController()
            nameScreenViewController.delegate = self
            navigationController?.pushViewController(nameScreenViewController, animated: true)
    }
    
    @objc private func raitingChangeButtonTapped() {
        let yourRatingPickerScreenViewController = YourRatingPickerScreenViewController()
            navigationController?.pushViewController(yourRatingPickerScreenViewController, animated: true)
            yourRatingPickerScreenViewController.delegate = self
    }
    
    @objc private func releaseDateChangeButtonTapped() {
        let releaseDatePickerScreenViewController = ReleaseDatePickerScreenViewController()
            navigationController?.pushViewController(releaseDatePickerScreenViewController, animated: true)
            releaseDatePickerScreenViewController.delegate = self
    }
    
    @objc private func linkButtonTapped() {
        let youTubeScreenViewController = YouTubeScreenViewController()
            navigationController?.pushViewController(youTubeScreenViewController, animated: true)
            youTubeScreenViewController.delegate = self
    }
    
    @objc private func saveButtonTapped() {
        if nameLabel.text != "-" && raitingLabel.text != "-" && releaseDateLabel.text != "-" && linkLabel.text != "-" && descriptionTextView.text != "-" && pickedImage != nil {
            movieInfo.name = nameLabel.text!
            movieInfo.rating = raitingLabel.text!
            movieInfo.releaseDate = releaseDateLabel.text!
            movieInfo.description = descriptionTextView.text!
            movieInfo.imageMovie = imgView.image!
            delegate?.transferMovieInfo(movieInfo)
            if let url = URL(string: linkLabel.text!) {
                movieInfo.youtubeLink = url
            }
            navigationController?.popViewController(animated: true)
        } else {
            showAllert("Fill in all fields")
        }
    }
    
    private func showAllert(_ msg: String) {
        let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    private func addStackViews() {
        verticalStackView.addArrangedSubview(gorizontalStackView1)
        verticalStackView.addArrangedSubview(gorizontalStackView2)
        gorizontalStackView1.addArrangedSubview(ch1)
        gorizontalStackView1.addArrangedSubview(ch2)
        gorizontalStackView2.addArrangedSubview(ch3)
        gorizontalStackView2.addArrangedSubview(ch4)
    }
    
    private func addConstraints() {
        // translatesAutoresizingMaskIntoConstraints
        imgViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imgView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        gorizontalStackView1.translatesAutoresizingMaskIntoConstraints = false
        ch1.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        dash1.translatesAutoresizingMaskIntoConstraints = false
        nameChangeButton.translatesAutoresizingMaskIntoConstraints = false
        ch2.translatesAutoresizingMaskIntoConstraints = false
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        dash2.translatesAutoresizingMaskIntoConstraints = false
        raitingChangeButton.translatesAutoresizingMaskIntoConstraints = false
        gorizontalStackView2.translatesAutoresizingMaskIntoConstraints = false
        ch3.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        dash3.translatesAutoresizingMaskIntoConstraints = false
        releaseDateChangeButton.translatesAutoresizingMaskIntoConstraints = false
        ch4.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        dash4.translatesAutoresizingMaskIntoConstraints = false
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainer.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        // imgViewContainer
        imgViewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 167).isActive = true
        imgViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgViewContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        // imgView
        imgView.centerXAnchor.constraint(equalTo: imgViewContainer.centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: imgViewContainer.centerYAnchor).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgViewContainer.heightAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        // verticalStackView
        verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: imgViewContainer.bottomAnchor, constant: 10).isActive = true
        verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
        
        // gorizontalStackView1
        // ch1
        // nameLabel
        nameLabel.centerXAnchor.constraint(equalTo: dash1.centerXAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: ch1.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: ch1.trailingAnchor, constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: dash1.topAnchor, constant: -10).isActive = true
        // dash1
        dash1.centerXAnchor.constraint(equalTo: ch1.centerXAnchor).isActive = true
        dash1.centerYAnchor.constraint(equalTo: ch1.centerYAnchor).isActive = true
        // nameChangeButton
        nameChangeButton.topAnchor.constraint(equalTo: dash1.bottomAnchor, constant: 10).isActive = true
        nameChangeButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        nameChangeButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
        
        // ch2
        // raitingLabel
        raitingLabel.centerXAnchor.constraint(equalTo: dash2.centerXAnchor).isActive = true
        raitingLabel.leadingAnchor.constraint(equalTo: ch2.leadingAnchor, constant: 10).isActive = true
        raitingLabel.trailingAnchor.constraint(equalTo: ch2.trailingAnchor, constant: -10).isActive = true
        raitingLabel.bottomAnchor.constraint(equalTo: dash2.topAnchor, constant: -10).isActive = true
        // dash2
        dash2.centerXAnchor.constraint(equalTo: ch2.centerXAnchor).isActive = true
        dash2.centerYAnchor.constraint(equalTo: ch2.centerYAnchor).isActive = true
        // raitingChangeButton
        raitingChangeButton.topAnchor.constraint(equalTo: dash2.bottomAnchor, constant: 10).isActive = true
        raitingChangeButton.leadingAnchor.constraint(equalTo: raitingLabel.leadingAnchor).isActive = true
        raitingChangeButton.trailingAnchor.constraint(equalTo: raitingLabel.trailingAnchor).isActive = true
        
        // gorizontalStackView2
        // ch3
        // releaseDateLabel
        releaseDateLabel.centerXAnchor.constraint(equalTo: dash3.centerXAnchor).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: ch3.leadingAnchor, constant: 10).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: ch3.trailingAnchor, constant: -10).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: dash3.topAnchor, constant: -10).isActive = true
        // dash3
        dash3.centerXAnchor.constraint(equalTo: ch3.centerXAnchor).isActive = true
        dash3.centerYAnchor.constraint(equalTo: ch3.centerYAnchor).isActive = true
        // releaseDateChangeButton
        releaseDateChangeButton.topAnchor.constraint(equalTo: dash3.bottomAnchor, constant: 10).isActive = true
        releaseDateChangeButton.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor).isActive = true
        releaseDateChangeButton.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor).isActive = true
        
        // ch4
        // linkLabel
        linkLabel.centerXAnchor.constraint(equalTo: dash4.centerXAnchor).isActive = true
        linkLabel.leadingAnchor.constraint(equalTo: ch4.leadingAnchor, constant: 10).isActive = true
        linkLabel.trailingAnchor.constraint(equalTo: ch4.trailingAnchor, constant: -10).isActive = true
        linkLabel.bottomAnchor.constraint(equalTo: dash4.topAnchor, constant: -10).isActive = true
        // dash4
        dash4.centerXAnchor.constraint(equalTo: ch4.centerXAnchor).isActive = true
        dash4.centerYAnchor.constraint(equalTo: ch4.centerYAnchor).isActive = true
        // linkButton
        linkButton.topAnchor.constraint(equalTo: dash4.bottomAnchor, constant: 10).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: linkLabel.leadingAnchor).isActive = true
        linkButton.trailingAnchor.constraint(equalTo: linkLabel.trailingAnchor).isActive = true
        
        // descriptionContainer
        descriptionContainer.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor).isActive = true
        descriptionContainer.leadingAnchor.constraint(equalTo: imgViewContainer.leadingAnchor).isActive = true
        descriptionContainer.trailingAnchor.constraint(equalTo: imgViewContainer.trailingAnchor).isActive = true
        descriptionContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        // descriptionLabel
        descriptionLabel.centerXAnchor.constraint(equalTo: descriptionContainer.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 20).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: imgViewContainer.widthAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
        // descriptionTextView
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor).isActive = true
    }
}
// MARK: - Helpers

extension AddNewFilmScreenViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallary()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
        }))
        present(alert, animated: true, completion: nil)
    }
    
    private func openCamera() {
        if UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func openGallary() {
        if UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imgView.image = image
            pickedImage = image
        }
        if let image = info[.editedImage] as? UIImage {
            imgView.image = image
            pickedImage = image
        }
    }
}

extension AddNewFilmScreenViewController: TransferDataBetweenVCDelegate {
    func transferMovieName(_ name: String) {
        dash1.text = name
    }
    
    func transferMovieRating(_ rating: String) {
        dash2.text = rating
    }
    
    func transferMovieDate(_ date: Date) {
        let dateformatter = DateFormatter() // in  private let        //dateformatter.dateFormat = "dd MMMM yyyy"
        dateformatter.dateFormat = "yyyy"
        dash3.text = dateformatter.string(from: date)
    }
    
    func transferMovieYouTube(_ url: URL) {
        dash4.text = url.absoluteString
    }
}
