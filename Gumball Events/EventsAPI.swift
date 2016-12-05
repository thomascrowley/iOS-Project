//
//  EventsAPI.swift
//  Gumball Events
//
//  Created by Thomas Crowley [sc14talc] on 03/12/2016.
//  Copyright © 2016 Thomas Crowley [sc14talc]. All rights reserved.
//

import Foundation

let key = "2Qm4LQs466gpMpnV"


//func postKey(){
//    
//
//
//var request = URLRequest(url: URL(string: "http://api.eventful.com/json/events/search?app_key=2Qm4LQs466gpMpnV&keywords=books&location=San+Diego&date=Futureo")!)
////request.httpMethod = "POST"
////let postString = key
////request.httpBody = postString.data(using: .utf8)
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//    guard let data = data, error == nil else {                                                 // check for fundamental networking error
//        print("error=\(error)")
//        return
//    }
//    
//    if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
//        print("statusCode should be 200, but is \(httpStatus.statusCode)")
//        print("response = \(response)")
//    }
//    
//    let responseString = String(data: data, encoding: .utf8)
//    print("responseString = \(responseString)")
//}
//task.resume()
//}

class EventsStream: CustomStringConvertible
{
    /// A textual representation of this instance.
    ///
    /// Instead of accessing this property directly, convert an instance of any
    /// type to a string by using the `String(describing:)` initializer. For
    /// example:
    ///
    ///     struct Point: CustomStringConvertible {
    ///         let x: Int, y: Int
    ///
    ///         var description: String {
    ///             return "(\(x), \(y))"
    ///         }
    ///     }
    ///
    ///     let p = Point(x: 21, y: 30)
    ///     let s = String(describing: p)
    ///     print(s)
    ///     // Prints "(21, 30)"
    ///
    /// The conversion of `p` to a string in the assignment to `s` uses the
    /// `Point` type's `description` property.
    public var description: String

  
//    var total_items: Int = 0
//    var page_size: Int = 0
//    var page_count: Int = 0
//    var page_number: Int = 0
//    var page_items: Int = 0
//    var first_item: Int = 0
//    var last_item: Int = 0
//    var search_time: Float = 0
//    var events: [Event] = []

    
    
    
func getResponse()
{
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let baseURL = URL(string: "http://api.eventful.com/json/events/search?app_key=2Qm4LQs466gpMpnV&location=San+Diego&date=Futureo&q=music")!
    print("Set up session")
    
    let eventTask = session.dataTask(with: baseURL, completionHandler: {
        (body, response, error) in
        
        print(response)
        if error != nil {
            
            print("Error: " + error!.localizedDescription)
        } else {
            
            do {
                
                if let json = try JSONSerialization.jsonObject(with: body!, options: .allowFragments) as? [String: Any] {
                    print(json)
                }
            } catch {
                
                print("error in JSONSerialization")
            }
        }
    })
    eventTask.resume()
}
    
    
    func getTotItems()->Int
    {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let baseURL = URL(string: "http://api.eventful.com/json/events/search?app_key=2Qm4LQs466gpMpnV&location=San+Diego&date=Futureo&q=music")!
        print("Set up session")
        
//        var total_items: Int = 123456789
        let eventTask = session.dataTask(with: baseURL, completionHandler: {
            (body, response, error) in
            
            print(response)
            if error != nil {
                
                print("Error: " + error!.localizedDescription)
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: body!, options: .allowFragments) as? [String: Any] {
//                        print(json)
                        let total_items_str = (json["total_items"] as? String)!
                        print ("this is what you are looking for\n\n")
                        print (total_items_str)
                        self.total_items = Int(total_items_str)!
                        print(self.total_items)
//                        }

                    }
                } catch {
                    
                    print("error in JSONSerialization")
                }
            }
        })
        eventTask.resume()
        
        return self.total_items

    }
    
    
    func getTheHeader()
    {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let baseURL = URL(string: "http://api.eventful.com/json/events/search?app_key=2Qm4LQs466gpMpnV&location=San+Diego&date=Futureo&q=music")!
        print("Set up session")
        
        //        var total_items: Int = 123456789
        let eventTask = session.dataTask(with: baseURL, completionHandler: {
            (body, response, error) in
            
            print(response)
            if error != nil {
                
                print("Error: " + error!.localizedDescription)
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: body!, options: .allowFragments) as? [String: Any] {
                        //                        print(json)
                        self.total_items = (json["total_items"] as? Int)!
                        self.page_size = (json["page_size"] as? Int)!
                        self.page_count = (json["page_count"] as? Int)!
                        self.page_number = (json["page_number"] as? Int)!
                        self.page_items = (json["page_items"] as? Int)!
                        self.first_item = (json["first_item"] as? Int)!
                        self.last_item = (json["last_item"] as? Int)!
                        self.search_time = (json["search_time"] as? Float)!
                        
                    }
                } catch {
                    
                    print("error in JSONSerialization")
                }
            }
        })
        eventTask.resume()
    }
    
    init()
    {
        var total_items: Int = 0
        var page_size: Int = 0
        var page_count: Int = 0
        var page_number: Int = 0
        var page_items: Int = 0
        var first_item: Int = 0
        var last_item: Int = 0
        var search_time: Float = 0
        var events: [Event] = []
    }
    
//    init()
//    {
//        getTotItems()
//    }
}
