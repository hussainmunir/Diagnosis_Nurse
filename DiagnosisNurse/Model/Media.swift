import UIKit
struct Media {
    let key : String
    let filename : String
    let data : Data
    let mimeType : String
    init?(withImage image:UIImage, forkey key: String){
        self.key = key
        
        self.mimeType = "image/jpeg"
        self.filename = "photo\(arc4random()).jpeg"
        
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = data
        
    }
}

struct Media1 {
    let key : String
    let filename : String
    let data : Data
    let mimeType : String
    init?(withImage file:Data, forkey key: String){
        self.key = key
        self.mimeType = "application/pdf"
        self.filename = "pdf\(arc4random()).pdf"
        
//        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        self.data = file
        
        
    }

}
