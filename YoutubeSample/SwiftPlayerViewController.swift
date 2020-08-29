//
//  SwiftPlayerViewController.swift
//  YoutubeSample
//
//  Created by JongHyun Park on 2019/11/22.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit
import YouTubePlayer

class SwiftPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.layoutIfNeeded()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        let videoPlayer = YouTubePlayerView(frame: frame)
        videoPlayer.backgroundColor = UIColor.black
        self.playerView.insertSubview(videoPlayer, at: 0)
        if let videoUrl = URL(string: "https://www.youtube.com/watch?v=BCr7y4SLhck") {
            videoPlayer.loadVideoURL(videoUrl)
        }
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .landscapeLeft]
    }
    override var shouldAutorotate: Bool {
        return true
    }
    
    @IBAction func fullScreenBtnClicked(_ sender: Any) {
        let orientation:UIInterfaceOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.value(forKey: "orientation") as! Int)!
        if orientation == .landscapeLeft {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }else {
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
        }
    }
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SwiftPlayerViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cell = UITableViewCell.init()
        cell.textLabel!.text = String("Section[\(section)] Row[\(row)]")
        return cell
    }
}

