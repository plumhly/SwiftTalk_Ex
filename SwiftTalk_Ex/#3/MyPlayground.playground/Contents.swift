//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

struct Episode {
    let title: String
}


final class EpisodeDetailViewController: UIViewController {
    
    let titleLabel = UILabel()
    
    convenience init(episode: Episode) {
        self.init()
        titleLabel.text = episode.title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
    }
}
