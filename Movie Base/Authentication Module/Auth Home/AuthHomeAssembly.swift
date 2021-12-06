//
//  MovieBaseAssembly.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import UIKit

final class AuthHomeAssembly: NSObject {
    
    //MARK: - Outlets
    
    @IBOutlet weak var viewController: UIViewController!
    
    //MARK: - NSObject
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let viewController = viewController as? AuthHomeViewController else { return }
        
        let authHomeRouter = AuthHomeRouter(authHomeViewController: viewController)
        let authHomePresenter = AuthHomePresenter(authHomeRouter: authHomeRouter)
        
        viewController.authHomeViewControllerOutput = authHomePresenter
    }
}
