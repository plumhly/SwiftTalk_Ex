//: Playground - noun: a place where people can play

import UIKit

struct Episode {
    
}

struct Media {
    
}

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}



//final class Webservice {
//    func loadEpisode(completion:(([Episode]?) -> Void)) {
//        //TODO
//    }
//
//    func loadMedia(eposode: Episode, completion:(Media?) -> Void) {
//        //TODO
//    }
//}

let url: URL = URL(string: "dfdf")!
let episodesResource = Resource<Data>(url: url) { data in
    return data
}

final class Webservice {
    func load<A>(resource: Resource<A>, completion:@escaping (A?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { (data, _, _) in
            //round 1
            if let data = data {
               completion(resource.parse(data))
            } else {
                completion(nil)
            }
            //round 2
            guard let data = data else {
                completion(nil)
                return
            }
            completion(resource.parse(data))
            //round 3
            let result = data.flatMap(resource.parse)
        }.resume()
    }
}

Webservice().load(resource: episodesResource) { result in
    print(result)
}



