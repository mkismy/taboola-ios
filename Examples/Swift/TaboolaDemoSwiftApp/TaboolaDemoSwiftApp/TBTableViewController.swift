//
//  TBTableViewController.swift
//  TaboolaDemoSwiftApp
//
//  Created by Yuta Amakawa on 2019/02/15.
//  Copyright © 2019 Taboola. All rights reserved.
//

import UIKit
import TaboolaSDK

class TaboolaCell: UITableViewCell {

    @IBOutlet weak var taboolaView: TaboolaView!

}

class TBTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.row {
        case 1:
            return TaboolaView.widgetHeight()
        default:
            return UITableViewAutomaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case 1:
            let taboolaCell = tableView.dequeueReusableCell(withIdentifier: "taboolaCell", for: indexPath) as! TaboolaCell
            taboolaCell.taboolaView.delegate = self
            taboolaCell.taboolaView.ownerViewController = self
            taboolaCell.taboolaView.mode = "alternating-thumbnails-b";
            taboolaCell.taboolaView.publisher = "sankeiplus-app-ios-sdkstandard";
            taboolaCell.taboolaView.pageType = "article";
            taboolaCell.taboolaView.pageUrl = "https://www.sanspo.com/geino/news/20190527/geo19052705000001-n1.html";
            taboolaCell.taboolaView.placement = "Below Article Thumbnails";
            taboolaCell.taboolaView.targetType = "mix";
            taboolaCell.taboolaView.setInterceptScroll(true)
            taboolaCell.taboolaView.fetchContent()
            return taboolaCell
        default:
            let textCell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
            return textCell
        }
    }
}

extension TBTableViewController: TaboolaViewDelegate {

    func taboolaView(_ taboolaView: UIView!, placementNamed placementName: String!, resizedToHeight height: CGFloat) {
        //
    }

    func taboolaView(_ taboolaView: UIView!, didLoadPlacementNamed placementName: String!, withHeight height: CGFloat) {
        //
    }

    func taboolaView(_ taboolaView: UIView!, didFailToLoadPlacementNamed placementName: String!, withErrorMessage error: String!) {
        //
    }

    func onItemClick(_ placementName: String!, withItemId itemId: String!, withClickUrl clickUrl: String!, isOrganic organic: Bool) -> Bool {
        return true
    }
}
