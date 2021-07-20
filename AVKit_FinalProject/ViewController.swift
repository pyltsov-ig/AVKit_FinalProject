//
//  ViewController.swift
//  AVKit_FinalProject
//
//  Created by Igor Pyltsov on 20.07.2021.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    
//    private (set) var tableView: UITableView = {
//        let tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
//        let tableViewCell = UITableViewCell()
//        return tableView
//    }()
    private var tableView = UITableView()
    
    let movies = Video.getVideoArray()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        //tableView.register(UINib(nibName: "CustomCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
        
       
        //tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: "cell")
       
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        
        
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.videoTitle.text = movies[indexPath.row].videoTitle
        cell.videoImage.image = movies[indexPath.row].videoImage
        
        //cell.imageView?.image = movies[indexPath.row].videoImage
        //cell.textLabel?.text = movies[indexPath.row].videoTitle
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let player = AVPlayer(url: movies[indexPath.row].videoUrl)
        let playerController = AVPlayerViewController()
        playerController.player = player
        playerController.allowsPictureInPicturePlayback = true
        
        self.present(playerController, animated: true) {
            playerController.player?.play()
        }
    }
    
}


