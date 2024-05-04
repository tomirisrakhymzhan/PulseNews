//
//  SavedNewsViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 30/04/2024.
//

import UIKit

class SavedNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var tableView: UITableView!
    var dataSource = SingletonDataSource.sharedInstance.getAllSavedNews() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: NewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        dataSource = SingletonDataSource.sharedInstance.getAllSavedNews()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath)
        as! NewsTableViewCell
        cell.setupUI(news: dataSource[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "ReadNewsViewController") as! ReadNewsViewController
        let news = dataSource[indexPath.row]
        detailVC.newsImageName = news.imageName
        detailVC.newsTitle = news.title
        detailVC.category = news.category
        detailVC.numOfReads = news.numOfReads
        detailVC.postDate = news.postDate!
        detailVC.newsBody = news.newsBody

        navigationController?.pushViewController(detailVC, animated: true)


    }
}
