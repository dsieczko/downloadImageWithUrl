//
//  downloadImageWithUrl.swift
//  
//
//  Created by D on 12/1/14.
//  Copyright (c) 2014 D. All rights reserved.
//

func downloadImageWithUrl(url: NSURL, completionHandler:(succeeded: Bool, image: UIImage?) -> Void) -> Void {
    let session = NSURLSession.sharedSession()
    let request = NSMutableURLRequest(URL: url)
    
    let task = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
        if (error == nil) {
            let image = UIImage(data: data)
            completionHandler(succeeded: true, image: image)
        } else {
            completionHandler(succeeded: false, image: nil)
        }
    })
    task.resume()
}
