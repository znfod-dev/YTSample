//
//  BMPlayerViewController.swift
//  YoutubeSample
//
//  Created by JongHyun Park on 2019/11/22.
//  Copyright © 2019 znfod. All rights reserved.
//

import UIKit
import BMPlayer

class BMPlayerViewController: UIViewController {
    
    @IBOutlet weak var playerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

           self.navigationController?.isNavigationBarHidden = true
             self.view.layoutIfNeeded()
         }
         override func viewWillAppear(_ animated: Bool) {
             super.viewWillAppear(animated)
             let frame = CGRect.init(x: 0, y: 0, width: playerView.frame.width, height: playerView.frame.height)
            let videoPlayer = BMPlayer.init()
            videoPlayer.frame = frame
            let asset = BMPlayerResource(url: URL(string: "http://baobab.wdjcdn.com/14525705791193.mp4")!,
                                         name: "风格互换：原来你我相爱")
            videoPlayer.setVideo(resource: asset)
             self.playerView.insertSubview(videoPlayer, at: 0)
            
         }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
