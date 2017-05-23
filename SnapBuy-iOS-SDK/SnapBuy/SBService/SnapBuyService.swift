//
//  SnapBuyService.swift
//  SnapBuy-Sample
//
//  Created by Omer on 17/05/2017.
//  Copyright © 2017 Omer Karayel. All rights reserved.
//

import Foundation

public class SBService: NSObject {
    
    public typealias sbCompletionHandler = (_ response: [String: AnyObject]?, _ successBlock: Bool) ->Void
    public typealias sbFail = (_ errorMessage: String?) ->Void
    
    public var apiKey: String?
    
    // MARK: Shared Instance
    
    static let shared = SBService()
    
    func setApplicationKey(_ apiKey: String!) {
        self.apiKey = apiKey
    }
}

//MARK: - SnapBuy API Reference
extension SBService {
    
    
    //MARK: - Create Application Service
   
    /* @param name: Name of the application
     Return SBModel Class */
    
    public func createApplication(withName name: String!, success:@escaping (_ response: SBApplication) ->Void, fail: @escaping sbFail) ->Void {
        
        let request = SBApplicationRequest(name: name)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbApplication = SBApplication(dict: response!)
                success(sbApplication)
            } else {
                fail(response?["errorMessage"] as? String)
            }
           
            }.resume()
    }
    
    
    //MARK: - Delete Application Service
    
    /*@param id: Application ID
     Return SBModel Class
     */
    
    public func deleteApplication(withID id: NSNumber!, success:@escaping (_ response: SBModel) ->Void, fail: @escaping sbFail)  ->Void {
        
        let request = SBDeleteApplicationRequest(id: id)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbModel = SBModel(dict: response!)
                success(sbModel)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Get Application Detail Service
    
    /*@param id: Application ID
     Return SBApplicationDetails Class
     */
    public func getApplicationDetails(withID id: NSNumber!, success:@escaping (_ response: SBApplicationDetails) ->Void, fail: @escaping sbFail)  ->Void {
        
        let request = SBGetlicationRequest(id: id)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbApplicationDetails = SBApplicationDetails(dict: response!)
                success(sbApplicationDetails)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Get Applications Service
    
    /*@param id: Application ID
     Return SBApplications Class
     */
    public func getApplications(success:@escaping (_ response: SBApplications) ->Void, fail: @escaping sbFail)  ->Void {
        
        let request = SBGetlicationsRequest()
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbApplicationsDetails = SBApplications(dict: response!)
                success(sbApplicationsDetails)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Update Applications Service
    
    /*@param id: Application ID
     name: Name of Application
     Return SBApplications Class
     */
    
    public func updateApplication(withID id: NSNumber!, changeName name: String! ,success:@escaping (_ response: SBModel) ->Void, fail: @escaping sbFail) ->Void {
        
        let request = SBUpdateApplicationRequest(id: id, name: name)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbApplicationsDetails = SBModel(dict: response!)
                success(sbApplicationsDetails)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    
    //MARK: - Check Image Indexed Service
    
    /*@param imageURL: Image ID
                appid: Application ID
     Return 0/1 #response=1 means that imageURL is indexed before.
     */
    
    public func checkImageIndexed(withImageURL imageURL: String!, withAppID appid: NSNumber!,success:@escaping (_ response: Bool) ->Void, fail: @escaping sbFail)  ->Void {
        
        let request = SBCheckImageIndexedRequest(imageURL: imageURL, appid: appid)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                success(true)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Index New Image Service
    
    /*@param request: SBIndexNewImageRequest
     Return SBModel Class
     */
    public func indexNewImage(withSBIndexNewImageRequest request: SBIndexNewImageRequest!, success:@escaping (_ response: SBModel) ->Void, fail: @escaping sbFail)  ->Void  {
        
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbModel = SBModel(dict: response!)
                success(sbModel)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Delete Image Service
    
    /*@param imageID: Image ID
     Return SBModel Class
     */
    
    public func deleteImage(withImageID imageID: NSNumber!, success:@escaping (_ response: SBModel) ->Void, fail: @escaping sbFail) ->Void {
        
        let request = SBDeleteImageRequest(id: imageID)
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbModel = SBModel(dict: response!)
                success(sbModel)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Get Imge Service
    
    /*@param request: SBGetImagesRequest
     Return SBGetImages Class
     */
    
    public func getImage(withSBGetImagesRequest request: SBGetImagesRequest!, success:@escaping (_ response: [SBGetImages]) ->Void, fail: @escaping sbFail) ->Void  {
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                var returnArray = [SBGetImages]()
                if let sbGetImagesArray = response?["images"] as? NSArray {
                    for sbGetImages in sbGetImagesArray {
                        let getImages = SBGetImages(dict: sbGetImages as! [String : AnyObject])
                        returnArray.append(getImages)
                    }
                }
                success(returnArray)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Visual Search Service
    
    /*@param request: SBVisualSearchRequest
     Return [SBGetImages] Array Class
     */
    
    public func visualSearch(withSBVisualSearchRequest request: SBVisualSearchRequest!, success:@escaping (_ response: [SBGetImages]) -> Void, fail: @escaping sbFail) -> Void {
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                var returnArray = [SBGetImages]()
                if let sbGetImagesArray = response?["data"] as? NSArray {
                    for sbGetImages in sbGetImagesArray {
                        let getImages = SBGetImages(dict: sbGetImages as! [String : AnyObject])
                        returnArray.append(getImages)
                    }
                }
                success(returnArray)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    
    public func adultFiltering(withSBAdultFilteringRequest request: SBAdultFilteringRequest!, success:@escaping (_ response: SBAdultFilter) ->Void, fail: @escaping sbFail) ->Void  {
        //TO:DO resposnemodel
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbAdultFilter = SBAdultFilter(dict: response!)
                success(sbAdultFilter)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
    
    //MARK: - Get Image Tags Service
    
    /*@param request: SBGetImageTagsRequest
     Return SBImageTags  Class
     */
    
    public func getImageTags(withSBGetImageTagsRequest request: SBGetImageTagsRequest!, success:@escaping (_ response: SBImageTags) -> Void, fail: @escaping sbFail) -> Void {
        startTask(withURL: request.buildURLRequest()) { (response, isSuccess) in
            if isSuccess {
                let sbImageTags = SBImageTags(dict: response!)
                success(sbImageTags)
            } else {
                fail(response?["errorMessage"] as? String)
            }
            
            }.resume()
    }
}

//MARK: - Core Service
fileprivate extension SBService {
    
    //MARK: - Start Task
    
    fileprivate func startTask(withURL url: URLRequest,completionHandler:@escaping sbCompletionHandler) -> URLSessionTask{
        guard apiKey != nil else {
            fatalError("Api Key cannot be nil")
        }
        
        return URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            guard let httpResponse =  response as? HTTPURLResponse else {
                mainThread {
                    completionHandler(["errorMessage":error?.localizedDescription as AnyObject],false)
                }
                return
            }
            guard httpResponse.statusCode == 200
                else {
                    mainThread {
                        var errorMessage = ""
                        if let data = data {
                            let responseObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                            errorMessage = responseObject?["errorMessage"] as? String ?? ""
                        }
                        completionHandler(["errorMessage":"\(errorMessage)\n \(error?.localizedDescription ?? "") HTTP Status code error \(httpResponse.statusCode)" as AnyObject],false)
                    }
                    return
            }
            
            guard let data = data
                else {
                    mainThread {
                        completionHandler(["errorMessage":"JSONSerialization Error\(httpResponse.statusCode)" as AnyObject],false)
                    }
                    return
            }
            
            let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            var responseObject: [String:AnyObject]!
            
            if result is NSArray {
                responseObject = ["data": result as AnyObject]
            }
            if result is [String: AnyObject] {
                responseObject = result as! [String : AnyObject]
            }
            
            mainThread {
                if let errorMessage = responseObject["errorMessage"] as? String{
                    if errorMessage != "" {
                        completionHandler(responseObject,false)
                    } else {
                        completionHandler(responseObject,true)
                    }
                } else {
                    completionHandler(responseObject,true)
                }
            }
        })
    }
    
}

//Main Thread shortcut
private func mainThread(main: @escaping () -> ()) {
    DispatchQueue.main.async(execute: {
        main()
    })
}

