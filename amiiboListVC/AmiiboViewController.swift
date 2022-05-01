//
//  ViewController.swift
//  amiiboListVC
//
//  Created by Natthida Kritveeranant on 1/5/2565 BE.
//

import UIKit

class AmiiboViewController: UIViewController {

    private let tableView = UITableView()
//    private var amiiboList = [AmiiboEntity]()
    private var amiiboList: [AmiiboEntity] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()

        let anonymousFunction = { (fetchedAmiiboList: [AmiiboEntity]) in
            DispatchQueue.main.async {
                self.amiiboList = fetchedAmiiboList
                self.tableView.reloadData()
            }
        }

        AmiiboAPI.shared.fetchAmiiboList(onCompletion: anonymousFunction)
    }

    private func configureView() {
        view.backgroundColor = .systemBackground

        tableView.delegate = self
        tableView.register(AmiiboCell.self, forCellReuseIdentifier: "cellid")
        tableView.dataSource = self
        //        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cellid")
        //        tableView.separatorStyle = .none

        // MARK: SubView
        view.addSubview(tableView)

        // MARK: Layout
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ]
        )
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension AmiiboViewController: UITableViewDataSource , UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amiiboList.count
    }

    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        guard let cell = tableView.dequeueReusableCell(
    //            withIdentifier: "cellid",
    //            for: indexPath) as? MyTableViewCell else { return UITableViewCell() }
    //        cell.configure(with: amiiboList[indexPath.row])
    //        cell.delegate = self
    //        return cell
    //    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let amiibo = amiiboList[indexPath.row]

        guard let amiiboCell = cell as? AmiiboCell else {
            return cell
        }
        
        amiiboCell.nameLabel.text = amiibo.name
        amiiboCell.gameSeriesLabel.text = amiibo.gameSeries
        if let url = URL(string: amiibo.image) {
            amiiboCell.imageIV.loadImage(from: url)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, complectionHandler) in

            self.amiiboList.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)

            complectionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

