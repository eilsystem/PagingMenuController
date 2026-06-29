//
//  PagingMenuViewController.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 5/17/16.
//  Copyright © 2016 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

class PagingMenuViewController: UIViewController {
    var options: PagingMenuControllerCustomizable!
    var embedsPagingMenuInNavigationController = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let pagingMenuController = self.children.first as! PagingMenuController
        pagingMenuController.setup(options)
        if embedsPagingMenuInNavigationController {
            embedPagingMenuInNavigationController(pagingMenuController)
        }
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
    }

    private func embedPagingMenuInNavigationController(_ pagingMenuController: PagingMenuController) {
        guard let containerView = view.superview else { return }

        pagingMenuController.title = "Child NavigationController"
        pagingMenuController.willMove(toParent: nil)
        pagingMenuController.view.removeFromSuperview()
        pagingMenuController.removeFromParent()

        let navigationController = UINavigationController(rootViewController: pagingMenuController)
        navigationController.navigationBar.isTranslucent = false

        addChild(navigationController)
        containerView.addSubview(navigationController.view)
        navigationController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            navigationController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            navigationController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            navigationController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
        navigationController.didMove(toParent: self)
    }
}
