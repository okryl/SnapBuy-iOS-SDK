 //
 //  Requestable.swift
 //  SnapBuy-Sample
 //
 //  Created by Omer on 17/05/2017.
 //  Copyright © 2017 Omer Karayel. All rights reserved.
 //
 
 import Foundation
 import UIKit
 
 protocol SBRequestable {
    
    var basePath: String {get}
    
    var endpoint: String {get}
    
    var httpMethod: String {get}
    
    var param: Parameters? {get}
    
    var addionalHeader: HeaderParameter? {get}
    
    var paths: UIImage? {get}
    
 }
 
 extension SBRequestable {
    
    typealias Parameters = [String: Any]
    typealias HeaderParameter = [String: String]
    typealias JSONDictionary = [String: Any]
    
    // Base
    var basePath: String {
        get { return "http://api.snapbuyapp.com/" }
    }
    
    // Additional Header
    var addionalHeader: HeaderParameter? {
        get { return ["x-api-key":SBService.shared.apiKey!] }
    }
    
    // Path
    var urlPath: String {
        return basePath + endpoint
    }
    
    // URL
    var url: URL {
        return URL(string: urlPath)!
    }
    
    
    // Build URL Request
    func buildURLRequest() -> URLRequest {
        
        // Init
        var urlRequest = URLRequest(url: self.url)
        urlRequest.httpMethod = self.httpMethod
        urlRequest.timeoutInterval = TimeInterval(10 * 1000)
        // Encode param
        
        // Add addional Header if need
        if let additionalHeaders = self.addionalHeader {
            for (key, value) in additionalHeaders {
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        let boundary = generateBoundaryString()
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let jsonBody = try! createBody(with: param , boundary: boundary)
        
        urlRequest.httpBody = jsonBody
        
        return urlRequest
    }
    
    private func createBody(with parameters: [String: Any]?, boundary: String) throws -> Data {
        var body = Data()
        
        if parameters != nil {
            for (key, value) in parameters! {
                body.append("--\(boundary)\r\n")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
                body.append("\(value)\r\n")
            }
        }
        
        if paths != nil {
            
            let imageData = paths?.jpeg
            
            if(imageData == nil) {
                fatalError()
            }
            
            let fname = "imagefilename.jpeg"
            let mimetype = "image/jpeg"
            
            body.append("--\(boundary)\r\n")
            body.append("Content-Disposition: form-data; name=\"image\"; filename=\"\(fname)\"\r\n")
            body.append("Content-Type: \(mimetype)\r\n\r\n")
            body.append(imageData!)
            body.append("\r\n")
            
        }
        body.append("--\(boundary)--\r\n")
        return body
    }
    
    private func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
 }
 
 
 //MARK: - Helper
 
 private extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
 }
 
