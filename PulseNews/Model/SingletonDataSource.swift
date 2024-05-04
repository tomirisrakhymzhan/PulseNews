//
//  SingletonDataSource.swift
//  PulseNews
//
//  Created by Томирис Рахымжан on 30/04/2024.
//

import UIKit
class SingletonDataSource {
     
    static let sharedInstance = SingletonDataSource()

    private var data : [News]
    private init(){
        self.data = News.createNewsList(numOfNews: 12)
    }
    
    func updateNews(news: News) {
        if let index = self.data.firstIndex(where: { $0.id == news.id }) {
          self.data[index].isSaved = news.isSaved
        }
    }
    
    func getCount() -> Int {
        return self.data.count
    }
    
    func getElement(at index: Int) -> News? {
        guard index >= 0 && index < data.count else {
            return nil
        }
        return data[index]
    }
    
    func getAllSavedNews() -> [News] {
        return data.filter{$0.isSaved == true}
    }

}
