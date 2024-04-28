//
//  NewsViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 28/04/2024.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    @IBOutlet weak var tableView: UITableView!
    var dataSource = News.createNewsList(numOfNews: 12)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 250
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: NewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
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
    

}
