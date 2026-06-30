//
//  PagingMenuControllerOptions.swift
//  PagingMenuControllerDemo
//
//  Created by Yusuke Kita on 6/9/16.
//  Copyright © 2016 kitasuke. All rights reserved.
//

import UIKit
import PagingMenuController

struct MenuItemUsers: MenuItemViewCustomizable {}
struct MenuItemRepository: MenuItemViewCustomizable {}
struct MenuItemGists: MenuItemViewCustomizable {}
struct MenuItemOrganization: MenuItemViewCustomizable {}

struct PagingMenuOptions1: PagingMenuControllerCustomizable {
    let usersViewController = UsersViewController.instantiateFromStoryboard()
    let repositoriesViewController = RepositoriesViewController.instantiateFromStoryboard()
    let gistsViewController = GistsViewController.instantiateFromStoryboard()
    let organizationsViewController = OrganizationsViewController.instantiateFromStoryboard()

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .standard(widthMode: .flexible, centerItem: false, scrollingMode: .pagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .none
        }
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }

    struct MenuItemUsers: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemRepository: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemGists: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemOrganization: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: String(describing: self))
            return .multilineText(title: title, description: description)
        }
    }
}

struct PagingMenuOptions2: PagingMenuControllerCustomizable {
    let usersViewController = UsersViewController.instantiateFromStoryboard()
    let repositoriesViewController = RepositoriesViewController.instantiateFromStoryboard()
    let gistsViewController = GistsViewController.instantiateFromStoryboard()
    let organizationsViewController = OrganizationsViewController.instantiateFromStoryboard()

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController])
    }
    var menuControllerSet: MenuControllerSet {
        return .single
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions3: PagingMenuControllerCustomizable {
    let usersViewController = UsersViewController.instantiateFromStoryboard()
    let repositoriesViewController = RepositoriesViewController.instantiateFromStoryboard()
    let gistsViewController = GistsViewController.instantiateFromStoryboard()
    let organizationsViewController = OrganizationsViewController.instantiateFromStoryboard()

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .three
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .fixed(width: 80), scrollingMode: .scrollEnabled)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions4: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .menuView(menuOptions: MenuOptions())
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: UIColor.blue, horizontalPadding: 10, verticalPadding: 0)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions5: PagingMenuControllerCustomizable {
    var componentType: ComponentType {
        return .menuView(menuOptions: MenuOptions())
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .flexible, scrollingMode: .pagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .roundRect(radius: 12, horizontalPadding: 8, verticalPadding: 8, selectedColor: UIColor.lightGray)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }
}

struct PagingMenuOptions6: PagingMenuControllerCustomizable {
    let usersViewController = UsersViewController.instantiateFromStoryboard()
    let repositoriesViewController = RepositoriesViewController.instantiateFromStoryboard()
    let gistsViewController = GistsViewController.instantiateFromStoryboard()
    let organizationsViewController = OrganizationsViewController.instantiateFromStoryboard()

    var componentType: ComponentType {
        return .pagingController(pagingControllers: [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController])
    }
    var defaultPage: Int {
        return 1
    }
}

struct PagingMenuOptions7: PagingMenuControllerCustomizable {
    let usersViewController = UsersViewController.instantiateFromStoryboard()
    let repositoriesViewController = RepositoriesViewController.instantiateFromStoryboard()
    let gistsViewController = GistsViewController.instantiateFromStoryboard()
    let organizationsViewController = OrganizationsViewController.instantiateFromStoryboard()

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [usersViewController, repositoriesViewController, gistsViewController, organizationsViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .three
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .fixed(width: 80), scrollingMode: .scrollEnabled)
        }
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemUsers(), MenuItemRepository(), MenuItemGists(), MenuItemOrganization()]
        }
    }

    struct MenuItemUsers: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: "Users")
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemRepository: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: "Repos")
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemGists: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: "Gists")
            return .multilineText(title: title, description: description)
        }
    }
    struct MenuItemOrganization: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "Menu")
            let description = MenuItemText(text: "Orgs")
            return .multilineText(title: title, description: description)
        }
    }
}

struct PagingMenuOptions8: PagingMenuControllerCustomizable {
    private let firstViewController = NavigationExampleListViewController(
        title: "First Stack",
        items: ["First Detail 1", "First Detail 2", "First Detail 3"])
    private let secondViewController = NavigationExampleListViewController(
        title: "Second Stack",
        items: ["Second Detail 1", "Second Detail 2", "Second Detail 3"])

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: [firstViewController, secondViewController])
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .all
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [NavigationMenuItem(title: "First Nav"), NavigationMenuItem(title: "Second Nav")]
        }
    }

    private struct NavigationMenuItem: MenuItemViewCustomizable {
        let title: String

        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: title))
        }
    }
}

struct PagingMenuOptions9: PagingMenuControllerCustomizable {
    private let shopNewsViewController = NavigationExampleListViewController(
        title: "Items Topics",
        items: ["Items Topic 1", "Items Topic 2", "Items Topic 3"])
    private let campaignViewController = NavigationExampleListViewController(
        title: "Sample Notices",
        items: ["Sample Notice 1", "Sample Notice 2", "Sample Notice 3"])
    private let popupShopViewController = NavigationExampleListViewController(
        title: "Basic Items",
        items: ["Basic Item 1", "Basic Item 2", "Basic Item 3"])
    private let giftsViewController = NavigationExampleListViewController(
        title: "Suggested Sets",
        items: ["Suggested Set 1", "Suggested Set 2", "Suggested Set 3"])
    private let coordinationViewController = NavigationExampleListViewController(
        title: "Menu Details",
        items: ["Menu Detail 1", "Menu Detail 2", "Menu Detail 3"])

    var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    var lazyLoadingPage: LazyLoadingPage {
        return .three
    }
    private var pagingControllers: [UIViewController] {
        return [
            shopNewsViewController,
            campaignViewController,
            popupShopViewController,
            giftsViewController,
            coordinationViewController
        ]
    }

    struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .infinite(widthMode: .flexible, scrollingMode: .pagingEnabled)
        }
        var focusMode: MenuFocusMode {
            return .underline(height: 3, color: DemoMenuColor.mainColor, horizontalPadding: 20, verticalPadding: 0)
        }
        var height: CGFloat {
            return 60
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItemShopNews(), MenuItemUsers(), MenuItemPopupShops(), MenuItemGifts(), MenuItemCoordination()]
        }
        var animationDuration: TimeInterval {
            return 0.1
        }
    }

    struct MenuItemShopNews: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "アイテム\nトピック", selectedColor: DemoMenuColor.mainColor, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.boldSystemFont(ofSize: 15))
            return .text(title: title)
        }
    }

    struct MenuItemUsers: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "サンプル一覧・\nお知らせ", selectedColor: DemoMenuColor.mainColor, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.boldSystemFont(ofSize: 15))
            return .text(title: title)
        }
    }

    struct MenuItemPopupShops: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "基本情報\nアイテム", selectedColor: DemoMenuColor.mainColor, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.boldSystemFont(ofSize: 15))
            return .text(title: title)
        }
    }

    struct MenuItemGifts: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "おすすめ\n設定集", selectedColor: DemoMenuColor.mainColor, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.boldSystemFont(ofSize: 15))
            return .text(title: title)
        }
    }

    struct MenuItemCoordination: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            let title = MenuItemText(text: "メニュー\n詳細へ", selectedColor: DemoMenuColor.mainColor, font: UIFont.systemFont(ofSize: 15), selectedFont: UIFont.boldSystemFont(ofSize: 15))
            return .text(title: title)
        }
    }
}

private struct DemoMenuColor {
    static let mainColor = UIColor.blue
}

private final class NavigationExampleListViewController: UITableViewController {
    private let items: [String]
    private let cellIdentifier = "NavigationExampleCell"

    init(title: String, items: [String]) {
        self.items = items
        super.init(style: .plain)
        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        let item = items[(indexPath as NSIndexPath).row]

        cell.textLabel?.text = item
        cell.detailTextLabel?.text = "Push inside \(title ?? "NavigationController")"
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = items[(indexPath as NSIndexPath).row]
        let detailViewController = NavigationExampleDetailViewController(
            stackTitle: title ?? "NavigationController",
            itemTitle: item,
            itemNumber: (indexPath as NSIndexPath).row + 1)
        ancestorNavigationController?.pushViewController(detailViewController, animated: true)
    }

    private var ancestorNavigationController: UINavigationController? {
        var viewController = parent
        while let currentViewController = viewController {
            if let navigationController = currentViewController as? UINavigationController {
                return navigationController
            }
            viewController = currentViewController.parent
        }
        return nil
    }
}

private final class NavigationExampleDetailViewController: UIViewController {
    private let stackTitle: String
    private let itemNumber: Int

    init(stackTitle: String, itemTitle: String, itemNumber: Int) {
        self.stackTitle = stackTitle
        self.itemNumber = itemNumber
        super.init(nibName: nil, bundle: nil)
        title = itemTitle
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let stackLabel = UILabel()
        stackLabel.translatesAutoresizingMaskIntoConstraints = false
        stackLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        stackLabel.textAlignment = .center
        stackLabel.text = stackTitle

        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.font = UIFont.systemFont(ofSize: 18)
        detailLabel.textColor = UIColor.darkGray
        detailLabel.textAlignment = .center
        detailLabel.numberOfLines = 0
        detailLabel.text = "Detail \(itemNumber) is pushed by the nested navigation controller."

        view.addSubview(stackLabel)
        view.addSubview(detailLabel)

        NSLayoutConstraint.activate([
            stackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            detailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            detailLabel.topAnchor.constraint(equalTo: stackLabel.bottomAnchor, constant: 12)
            ])
    }
}
