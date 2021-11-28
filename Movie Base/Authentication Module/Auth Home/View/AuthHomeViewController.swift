//
//  ViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import AVFoundation

class AuthHomeViewController: UIViewController {
  
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    var authHomeViewControllerOutput: AuthHomeViewControllerOutput!
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackGroundVideo()
        setup()
    }

    func playBackGroundVideo() {
        let theURL = Bundle.main.url(forResource:"pexels-tima-miroshnichenko-7989632", withExtension: "mp4")
        
                avPlayer = AVPlayer(url: theURL!)
                avPlayerLayer = AVPlayerLayer(player: avPlayer)
                avPlayerLayer.videoGravity = .resizeAspectFill
                avPlayer.volume = 0
                avPlayer.actionAtItemEnd = .none

                avPlayerLayer.frame = view.layer.bounds
                view.backgroundColor = .clear
                view.layer.insertSublayer(avPlayerLayer, at: 0)

                NotificationCenter.default.addObserver(self,
                                                   selector: #selector(playerItemDidReachEnd(notification:)),
                                                   name: .AVPlayerItemDidPlayToEndTime,
                                                   object: avPlayer.currentItem)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
            let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: .zero, completionHandler: nil)
        }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            avPlayer.play()
            paused = false
        }

        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            avPlayer.pause()
            paused = true
        }
    
    func setup() {
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(signUpButton)
        loginButton.titleLabel?.textColor = UIColor.white
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        authHomeViewControllerOutput.didPressLoginButton()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        authHomeViewControllerOutput.didPressSignUpButton()
    }
}

