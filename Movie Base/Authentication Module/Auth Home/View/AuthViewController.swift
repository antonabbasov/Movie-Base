//
//  ViewController.swift
//  Movie Base
//
//  Created by Anton on 24.11.2021.
//

import UIKit
import AVFoundation

final class AuthViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    //MARK: - Variables
    
    var authHomeViewControllerOutput: AuthViewControllerOutput!
    private var avPlayer: AVPlayer!
    private var avPlayerLayer: AVPlayerLayer!
    private var paused: Bool = false
    
    // MARK: - Actions
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        authHomeViewControllerOutput.didPressLoginButton()
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        authHomeViewControllerOutput.didPressSignUpButton()
    }
    
    // MARK: - Instance Methods
    
    private func playBackGroundVideo() {
        guard let theURL = Bundle.main.url(forResource:Constants.AuthHomeControllerVideo.authHomeControllerVideoPath, withExtension: "mp4") else {
            return
        }
        
        avPlayer = AVPlayer(url: theURL)
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
    
    private func setupButtons() {
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(signUpButton)
        loginButton.titleLabel?.textColor = UIColor.white
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackGroundVideo()
        setupButtons()
        authHomeViewControllerOutput.viewDidLoad()
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
}
