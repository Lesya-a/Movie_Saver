import UIKit

protocol TransferMovieBetweenVCDelegate: AnyObject {
    func transferMovieInfo(_ movieInfo: MovieInfo)
}

struct MovieInfo {
    var name: String
    var rating: String
    var releaseDate: String
    var youtubeLink: URL
    var description: String
    var imageMovie: UIImage
    
    init() {
        self.name = ""
        self.rating = ""
        self.releaseDate = ""
        self.youtubeLink = URL(string: "https://www.youtube.com")!
        self.description = ""
        self.imageMovie = UIImage(named: "imgImage")!
    }
}
