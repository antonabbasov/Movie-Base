//
//  MovieBaseAssembly.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import Foundation
import UIKit

class AuthHomeAssembly: NSObject {
    @IBOutlet weak var viewController: UIViewController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let viewController = viewController as? AuthHomeViewController else { return }
        let authHomePresenter = AuthHomePresenter()
        let authHomeRouter = AuthHomeRouter()
        
        authHomePresenter.router = authHomeRouter
        authHomeRouter.authHomeViewController = viewController
        viewController.authHomeViewControllerOutput = authHomePresenter
    }
}
