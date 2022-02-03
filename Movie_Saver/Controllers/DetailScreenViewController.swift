import UIKit
import WebKit

final class DetailScreenViewController: UIViewController {

    // MARK: - Properties
    // MARK: Public
    public var movieInfo = MovieInfo()
    // MARK: Private
    private let imgView = UIImageView()
    private let mainView = UIView()
    private let nameLabel = UILabel()
    private let ratingAndYearLabel = UILabel()
    private let descriptionTextView = UITextView()
    private let linkWebView = WKWebView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupUI()
        addConstraints()
        addInfoMovie()
    }

    // MARK: - Setups
    private func addSubviews() {
        view.addSubview(imgView)
        view.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(ratingAndYearLabel)
        mainView.addSubview(descriptionTextView)
        mainView.addSubview(linkWebView)
    }

    private func setupUI() {
        imgViewSetup()
        mainViewSetup()
        nameLabelSetup()
        ratingAndYearLabelSetup()
        descriptionTextViewSetup()
    }

    private func imgViewSetup() {
        imgView.contentMode = .scaleToFill
    }

    private func mainViewSetup() {
        mainView.layer.cornerRadius = 16
        mainView.backgroundColor = .white
    }

    private func nameLabelSetup() {
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .black
        nameLabel.font = .manrope(ofSize: 24, weight: .bold)
    }

    private func ratingAndYearLabelSetup() {
        ratingAndYearLabel.textColor = .black
        ratingAndYearLabel.backgroundColor = .white
    }

    private func descriptionTextViewSetup() {
        descriptionTextView.textColor = .black
        descriptionTextView.font = .manrope(ofSize: 14, weight: .regular)
        descriptionTextView.layer.cornerRadius = 10
        descriptionTextView.isEditable = false
    }

    private func addConstraints() {
        addImgView()
        addMainView()
        addNameLabel()
        addRatingAndYearLabel()
        addDescriptionTextView()
        addLinkWebView()
    }

    private func addImgView() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imgView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imgView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

    private func addMainView() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: imgView.bottomAnchor, constant: -90).isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func addNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 19).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -19).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }

    private func addRatingAndYearLabel() {
        ratingAndYearLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingAndYearLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        ratingAndYearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        ratingAndYearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        ratingAndYearLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func addDescriptionTextView() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.topAnchor.constraint(equalTo: ratingAndYearLabel.bottomAnchor, constant: 13).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }

    private func addLinkWebView() {
        linkWebView.translatesAutoresizingMaskIntoConstraints = false
        linkWebView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 13).isActive = true
        linkWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
        linkWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -19).isActive = true
        linkWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }

    // MARK: - Helpers
    private func addInfoMovie() {
        imgView.image = movieInfo.imageMovie
        nameLabel.text = movieInfo.name
        descriptionTextView.text = movieInfo.description
        addRatingAndYearLabelInfo()
        linkWebView.load(URLRequest(url: movieInfo.youtubeLink))
    }

    private func addRatingAndYearLabelInfo() {
        let attachment = NSTextAttachment()

        attachment.image = UIImage(named: "Star.png")

        let attachmentString = NSMutableAttributedString(attachment: attachment)

        let firstAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.manrope(ofSize: 14, weight: .bold)
        ]
        let secondAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.manrope(ofSize: 14, weight: .regular)
        ]
        let thirdAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1),
            NSAttributedString.Key.font: UIFont.manrope(ofSize: 14, weight: .regular)
        ]
        let firstString =
            NSMutableAttributedString(string: "  \(movieInfo.rating)", attributes: firstAttributes)
        let secondString =
            NSAttributedString(string: "/10", attributes: secondAttributes)
        let thirdString =
            NSAttributedString(string: " \(movieInfo.releaseDate)", attributes: thirdAttributes)
        attachmentString.append(firstString)
        attachmentString.append(secondString)
        attachmentString.append(thirdString)
        ratingAndYearLabel.attributedText = attachmentString
    }
}
