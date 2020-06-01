//
//  ViewController.swift
//  HLS-Stream-Video
//
//  Created by Kelvin Fok on 12/4/18.
//  Copyright © 2018 kelvinfok. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    let videoUrl = URL(string: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8")!

    lazy var player: AVPlayer = {
        let asset = AVAsset(url: videoUrl)
        let playerItem = AVPlayerItem(asset: asset)
      return AVPlayer(playerItem: playerItem)
    }()
    
    lazy var playerLayer: AVPlayerLayer = {
       return  AVPlayerLayer(player: self.player)
     }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonTapped(_ sender: Any) {
        self.playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(self.playerLayer)
        player.play()
    }
    
    public func disconnectAVPlayer(){
        self.playerLayer.player = nil
    }
    
    public func reconnectAVPlayer(){
        self.playerLayer.player = self.player
    }
}
