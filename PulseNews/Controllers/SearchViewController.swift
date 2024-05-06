//
//  SearchViewController.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 30/04/2024.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, 
                                UITableViewDataSource,
                                UITableViewDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var filteredData: [News] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.placeholder = "Search for a news..."
        tableView.register(UINib(nibName: NewsTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        filteredData =  SingletonDataSource.sharedInstance.getAllNews()
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredData =  SingletonDataSource.sharedInstance.getAllNews()
            tableView.reloadData()

        } else {
            filteredData =  SingletonDataSource.sharedInstance.getAllNews().filter { item in
                return item.title.lowercased().contains(searchText.lowercased())
                    || item.category.lowercased().contains(searchText.lowercased())
                    || item.newsBody.lowercased().contains(searchText.lowercased())
            }
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.reuseIdentifier, for: indexPath)
        as! NewsTableViewCell
        let news = filteredData[indexPath.row] 
        cell.setupUI(news: news)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "ReadNewsViewController") as! ReadNewsViewController
        let news = filteredData[indexPath.row]
        detailVC.newsImageName = news.imageName
        detailVC.newsTitle = news.title
        detailVC.category = news.category
        detailVC.numOfReads = news.numOfReads
        detailVC.postDate = news.postDate!
        detailVC.newsBody = news.newsBody

        navigationController?.pushViewController(detailVC, animated: true)
    }

}

