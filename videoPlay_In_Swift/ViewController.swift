//
//  ViewController.swift
//  videoPlay_In_Swift
//
//  Created by Ripon sk on 20/10/22.
//

import UIKit
import AVKit
import AVFoundation
class ViewController: UIViewController {
    var player:AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        playvideo()
       NotificationCenter.default.addObserver(self, selector: #selector(resignactive), name: UIApplication.willResignActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playwhileactive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playbackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    @objc func playbackground(){
        player?.play()
    }
    @objc func playwhileactive(){
        player?.play()
    }
    @objc func resignactive(){
        player?.pause()
    }

    func playvideo(){
        let url = Bundle.main.url(forResource: "khermangdi", withExtension: "mp4")
        player = AVPlayer(url: url!)
        let playerlayer = AVPlayerLayer(player: player)
        playerlayer.frame = self.view.bounds
        player?.play()
        self.view.layer.addSublayer(playerlayer)
    }
}

