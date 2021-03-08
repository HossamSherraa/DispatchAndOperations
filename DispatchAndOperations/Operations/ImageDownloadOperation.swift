//
//  ImageDownloadOperation.swift
//  DispatchAndOperations
//
//  Created by Hossam on 08/03/2021.
//

import Foundation
import UIKit
class ImageDownloadOperation : AsyncOperation {
    let indexPath : IndexPath
    let imageUrl : String
    let completion : (UIImage? , IndexPath)->Void
    var task : URLSessionTask?
    init(imageUrl : String , indexPath : IndexPath, completion : @escaping (UIImage? , IndexPath)->Void) {
        self.imageUrl = imageUrl
        self.indexPath = indexPath
        self.completion = completion
        super.init()
        
    }
    
    
    
    override func main() {
        
        guard !isCancelled else {state = .finished  ; return}
        print(Thread.current , "📉")
        if let url = URL(string: imageUrl) {
            state = .executing
            task = URLSession.shared.dataTask(with: url , completionHandler:{ [weak self ]   data , response , error  in
                if let error = error {
                    print(error , "eee")
                }
                if let data = data {
                    let downloadedImage  = UIImage(data: data)
                    DispatchQueue.main.sync {
                        self?.completion(downloadedImage, self!.indexPath)
                        
                    }
                    self?.state = .finished
                }
            })
            task?.resume()
            guard !isCancelled else {state = .finished ; task?.cancel() ; return}
        }
    }
}
