//
//  ObjcPlayerViewController.swift
//  YoutubeSample
//
//  Created by JongHyun Park on 2019/11/22.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class ObjcPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var playerVars = [
        "autoplay": 1,
        "playsinline": 1,
        "autohide":1,
        "controls": 0,
        "showinfo": 1,
        "fs": 1,
        "rel": 0,
        "loop": 0,
        "enablejsapi": 1,
        "disablekv":1,
        "iv_load_policy":3,
        "modestbranding": 0,
    ]
    
    var videoPlayer:YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.layoutIfNeeded()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        videoPlayer = YTPlayerView(frame: frame)
        videoPlayer.backgroundColor = UIColor.black
        self.playerView.insertSubview(videoPlayer, at: 0)
        videoPlayer.load(withVideoId: "BCr7y4SLhck", playerVars: self.playerVars)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /*
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.viewControllerOrientation = 0
        */
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
            self.backView.isHidden = true
        }else {
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            self.backView.isHidden = false
        }
        let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
        videoPlayer.frame = frame
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ObjcPlayerViewController: UITableViewDelegate, UITableViewDataSource {
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


