//
//  BaseRouter.swift
//  Milllionaire
//
//  Created by Елена Русских on 2023-09-23.
//

import Foundation
import UIKit

protocol RouterProtocol {
    associatedtype Controller: UIViewController
    var viewController: Controller? { get }

    func start()
}

class BaseRouter<Controller: UIViewController>: RouterProtocol {
    weak var viewController: Controller?

    func start() {
        fatalError("Start method should be implemented.")
    }

    init(viewController: Controller?) {
        self.viewController = viewController
    }
}
