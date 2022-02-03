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
    private var movieInfo = MovieInfo()
    private let imgViewContainer = UIView()
    private let imgView = UIImageView(image: #imageLiteral(resourceName: "imgImage.png"))

    private let verticalStackView = UIStackView()
    private let gorizontalStackView1 = UIStackView()
    private let ch1 = UIView()
    private let nameLabel = UILabel()
    private let dash1 = UILabel()
    private let nameChangeButton = UIButton()

    private let ch2 = UIView()
    private let raitingLabel = UILabel()
    private let dash2 = UILabel()
    private let raitingChangeButton = UIButton()

    private let gorizontalStackView2 = UIStackView()
    private let ch3 = UIView()
    private let releaseDateLabel = UILabel()
    private let dash3 = UILabel()
    private let releaseDateChangeButton = UIButton()

    private let ch4 = UIView()
    private let linkLabel = UILabel()
    private let dash4 = UILabel()
    private let linkButton = UIButton()

    private let descriptionContainer = UIView()
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
        addStackViews()
        tappedImage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imgView.layer.cornerRadius = imgView.frame.size.width / 2
        imgView.clipsToBounds = true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - Setups
    private func configNavigationBar() {
        title = "Add new"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self,
            action: #selector(saveButtonTapped)
        )
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
        viewSetup()
        imgViewContainerSetup()
        verticalStackViewSetup()
        gorizontalStackView1Setup()
        nameLabelSetup()
        dash1Setup()
        nameChangeButtonSetup()
        raitingLabelSetup()
        dash2Setup()
        raitingChangeButtonSetup()
        gorizontalStackView2Setup()
        releaseDateLabelSetup()
        dash3Setup()
        releaseDateChangeButtonSetup()
        linkLabelSetup()
        dash4Setup()
        linkButtonSetup()
        descriptionContainerSetup()
        descriptionLabelSetup()
        descriptionTextViewSetup()
    }

    private func viewSetup() {
        view.backgroundColor = .white
    }

    private func imgViewContainerSetup() {
        imgViewContainer.backgroundColor = .white
    }

    private func verticalStackViewSetup() {
        verticalStackView.backgroundColor = .white
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.spacing = 10
    }

    private func gorizontalStackView1Setup() {
        gorizontalStackView1.backgroundColor = .white
        gorizontalStackView1.axis = .horizontal
        gorizontalStackView1.distribution = .fillEqually
        gorizontalStackView1.spacing = 10
    }

    private func nameLabelSetup() {
        nameLabel.text = "Name"
        nameLabel.textAlignment = .center
        nameLabel.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func dash1Setup() {
        dash1.text = "-"
        dash1.textAlignment = .center
        dash1.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func nameChangeButtonSetup() {
        nameChangeButton.setTitle("Change", for: .normal)
        nameChangeButton.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        nameChangeButton.setTitleColor(.systemBlue, for: .normal)
        nameChangeButton.addTarget(self, action: #selector(nameChangeButtonTapped), for: .touchUpInside)
    }

    private func raitingLabelSetup() {
        raitingLabel.text = "Your Rating"
        raitingLabel.textAlignment = .center
        raitingLabel.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func dash2Setup() {
        dash2.text = "-"
        dash2.textAlignment = .center
        dash2.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func raitingChangeButtonSetup() {
        raitingChangeButton.setTitle("Change", for: .normal)
        raitingChangeButton.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        raitingChangeButton.setTitleColor(.systemBlue, for: .normal)
        raitingChangeButton.addTarget(self, action: #selector(raitingChangeButtonTapped), for: .touchUpInside)
    }

    private func gorizontalStackView2Setup() {
        gorizontalStackView2.backgroundColor = .white
        gorizontalStackView2.axis = .horizontal
        gorizontalStackView2.distribution = .fillEqually
        gorizontalStackView2.spacing = 10
    }

    private func releaseDateLabelSetup() {
        releaseDateLabel.text = "Release Date"
        releaseDateLabel.textAlignment = .center
        releaseDateLabel.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func dash3Setup() {
        dash3.text = "-"
        dash3.textAlignment = .center
        dash3.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func releaseDateChangeButtonSetup() {
        releaseDateChangeButton.setTitle("Change", for: .normal)
        releaseDateChangeButton.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        releaseDateChangeButton.setTitleColor(.systemBlue, for: .normal)
        releaseDateChangeButton.addTarget(self, action: #selector(releaseDateChangeButtonTapped), for: .touchUpInside)
    }

    private func linkLabelSetup() {
        linkLabel.text = "YouTube Link"
        linkLabel.textAlignment = .center
        linkLabel.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func dash4Setup() {
        dash4.text = "-"
        dash4.textAlignment = .center
        dash4.font = .manrope(ofSize: 18, weight: .medium)
    }

    private func linkButtonSetup() {
        linkButton.setTitle("Change", for: .normal)
        linkButton.titleLabel?.font = .manrope(ofSize: 18, weight: .medium)
        linkButton.setTitleColor(.systemBlue, for: .normal)
        linkButton.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
    }

    private func descriptionContainerSetup() {
        descriptionContainer.backgroundColor = .white
    }

    private func descriptionLabelSetup() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = .manrope(ofSize: 18, weight: .medium)
        descriptionLabel.textAlignment = .center
    }

    private func descriptionTextViewSetup() {
        descriptionTextView.text = ""
        descriptionTextView.font = .manrope(ofSize: 14, weight: .regular)
    }

    private func tappedImage() {
        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(imageTapped(tapGestureRecognizer:))
        )
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
        let checkAllInformation = (
            dash1.text != "-" &&
                dash2.text != "-" &&
                dash3.text != "-" &&
                dash4.text != "-" &&
                descriptionTextView.text != "" &&
                pickedImage != nil
        )
        if checkAllInformation == true {
            movieInfo.name = dash1.text!
            movieInfo.rating = dash2.text!
            movieInfo.releaseDate = dash3.text!
            movieInfo.description = descriptionTextView.text!
            movieInfo.imageMovie = imgView.image!
            if let url = URL(string: dash4.text!) {
                movieInfo.youtubeLink = url
            }
            delegate?.transferMovieInfo(movieInfo)
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
        imgViewContainerConstraints()
        imgViewConstraints()
        verticalStackViewConstraints()
        nameLabelConstraints()
        dash1Constraints()
        nameChangeButtonConstraints()
        raitingLabelConstraints()
        dash2Constraints()
        raitingChangeButtonConstraints()
        releaseDateLabelConstraints()
        dash3Constraints()
        releaseDateChangeButtonConstraints()
        linkLabelConstraints()
        dash4Constraints()
        linkButtonConstraints()
        descriptionContainerConstraints()
        descriptionLabelConstraints()
        descriptionTextViewConstraints()
        otherTranslatesAutoresizingMaskIntoConstraints()
    }

    private func imgViewContainerConstraints() {
        imgViewContainer.translatesAutoresizingMaskIntoConstraints = false
        imgViewContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 167).isActive = true
        imgViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgViewContainer.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    private func imgViewConstraints() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerXAnchor.constraint(equalTo: imgViewContainer.centerXAnchor).isActive = true
        imgView.centerYAnchor.constraint(equalTo: imgViewContainer.centerYAnchor).isActive = true
        imgView.heightAnchor.constraint(equalTo: imgViewContainer.heightAnchor).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }

    private func verticalStackViewConstraints() {
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        verticalStackView.topAnchor.constraint(equalTo: imgViewContainer.bottomAnchor, constant: 10).isActive = true
        verticalStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.33).isActive = true
    }

    private func nameLabelConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: dash1.centerXAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: ch1.leadingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: ch1.trailingAnchor, constant: -10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: dash1.topAnchor, constant: -10).isActive = true
    }

    private func dash1Constraints() {
        dash1.translatesAutoresizingMaskIntoConstraints = false
        dash1.centerXAnchor.constraint(equalTo: ch1.centerXAnchor).isActive = true
        dash1.centerYAnchor.constraint(equalTo: ch1.centerYAnchor).isActive = true
        dash1.widthAnchor.constraint(equalTo: nameLabel.widthAnchor).isActive = true
    }

    private func nameChangeButtonConstraints() {
        nameChangeButton.translatesAutoresizingMaskIntoConstraints = false
        nameChangeButton.topAnchor.constraint(equalTo: dash1.bottomAnchor, constant: 10).isActive = true
        nameChangeButton.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        nameChangeButton.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor).isActive = true
    }

    private func raitingLabelConstraints() {
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        raitingLabel.centerXAnchor.constraint(equalTo: dash2.centerXAnchor).isActive = true
        raitingLabel.leadingAnchor.constraint(equalTo: ch2.leadingAnchor, constant: 10).isActive = true
        raitingLabel.trailingAnchor.constraint(equalTo: ch2.trailingAnchor, constant: -10).isActive = true
        raitingLabel.bottomAnchor.constraint(equalTo: dash2.topAnchor, constant: -10).isActive = true
    }

    private func dash2Constraints() {
        dash2.translatesAutoresizingMaskIntoConstraints = false
        dash2.centerXAnchor.constraint(equalTo: ch2.centerXAnchor).isActive = true
        dash2.centerYAnchor.constraint(equalTo: ch2.centerYAnchor).isActive = true
        dash2.widthAnchor.constraint(equalTo: raitingLabel.widthAnchor).isActive = true
    }

    private func raitingChangeButtonConstraints() {
        raitingChangeButton.translatesAutoresizingMaskIntoConstraints = false
        raitingChangeButton.topAnchor.constraint(equalTo: dash2.bottomAnchor, constant: 10).isActive = true
        raitingChangeButton.leadingAnchor.constraint(equalTo: raitingLabel.leadingAnchor).isActive = true
        raitingChangeButton.trailingAnchor.constraint(equalTo: raitingLabel.trailingAnchor).isActive = true
    }

    private func releaseDateLabelConstraints() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.centerXAnchor.constraint(equalTo: dash3.centerXAnchor).isActive = true
        releaseDateLabel.leadingAnchor.constraint(equalTo: ch3.leadingAnchor, constant: 10).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: ch3.trailingAnchor, constant: -10).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: dash3.topAnchor, constant: -10).isActive = true
    }

    private func dash3Constraints() {
        dash3.translatesAutoresizingMaskIntoConstraints = false
        dash3.centerXAnchor.constraint(equalTo: ch3.centerXAnchor).isActive = true
        dash3.centerYAnchor.constraint(equalTo: ch3.centerYAnchor).isActive = true
        dash3.widthAnchor.constraint(equalTo: releaseDateLabel.widthAnchor).isActive = true
    }

    private func releaseDateChangeButtonConstraints() {
        releaseDateChangeButton.translatesAutoresizingMaskIntoConstraints = false
        releaseDateChangeButton.topAnchor.constraint(equalTo: dash3.bottomAnchor, constant: 10).isActive = true
        releaseDateChangeButton.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor).isActive = true
        releaseDateChangeButton.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor).isActive = true
    }

    private func linkLabelConstraints() {
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.centerXAnchor.constraint(equalTo: dash4.centerXAnchor).isActive = true
        linkLabel.leadingAnchor.constraint(equalTo: ch4.leadingAnchor, constant: 10).isActive = true
        linkLabel.trailingAnchor.constraint(equalTo: ch4.trailingAnchor, constant: -10).isActive = true
        linkLabel.bottomAnchor.constraint(equalTo: dash4.topAnchor, constant: -10).isActive = true
    }

    private func dash4Constraints() {
        dash4.translatesAutoresizingMaskIntoConstraints = false
        dash4.centerXAnchor.constraint(equalTo: ch4.centerXAnchor).isActive = true
        dash4.centerYAnchor.constraint(equalTo: ch4.centerYAnchor).isActive = true
        dash4.widthAnchor.constraint(equalTo: linkLabel.widthAnchor).isActive = true
    }

    private func linkButtonConstraints() {
        linkButton.translatesAutoresizingMaskIntoConstraints = false
        linkButton.topAnchor.constraint(equalTo: dash4.bottomAnchor, constant: 10).isActive = true
        linkButton.leadingAnchor.constraint(equalTo: linkLabel.leadingAnchor).isActive = true
        linkButton.trailingAnchor.constraint(equalTo: linkLabel.trailingAnchor).isActive = true
    }

    private func descriptionContainerConstraints() {
        descriptionContainer.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainer.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor).isActive = true
        descriptionContainer.leadingAnchor.constraint(equalTo: imgViewContainer.leadingAnchor).isActive = true
        descriptionContainer.trailingAnchor.constraint(equalTo: imgViewContainer.trailingAnchor).isActive = true
        descriptionContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
    }

    private func descriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerXAnchor.constraint(equalTo: descriptionContainer.centerXAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 20).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: imgViewContainer.widthAnchor).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 26).isActive = true
    }

    private func descriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: descriptionContainer.bottomAnchor).isActive = true
    }

    private func otherTranslatesAutoresizingMaskIntoConstraints() {
        gorizontalStackView1.translatesAutoresizingMaskIntoConstraints = false
        ch1.translatesAutoresizingMaskIntoConstraints = false
        ch2.translatesAutoresizingMaskIntoConstraints = false
        gorizontalStackView2.translatesAutoresizingMaskIntoConstraints = false
        ch3.translatesAutoresizingMaskIntoConstraints = false
        ch4.translatesAutoresizingMaskIntoConstraints = false
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
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    private func openGallary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            present(imagePicker, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [
        UIImagePickerController.InfoKey: Any
    ]) {
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
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy"
        dash3.text = dateformatter.string(from: date)
    }

    func transferMovieYouTube(_ url: URL) {
        dash4.text = url.absoluteString
    }
}
