//
//  MovieBaseAssembly.swift
//  Movie Base
//
//  Created by Anton on 28.11.2021.
//

import UIKit

final class AuthAssembly: NSObject {
    
    //MARK: - Outlets
    
    @IBOutlet weak var viewController: UIViewController!
    
    //MARK: - NSObject
    
    override func awakeFromNib() {
        super.awakeFromNib()
        guard let viewController = viewController as? AuthViewController else { return }
        
        let router = AuthRouter(authHomeViewController: viewController)
        let presenter = AuthPresenter(authHomeRouter: router)
        
        viewController.authHomeViewControllerOutput = presenter
    }
}
