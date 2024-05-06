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
        self.data = News.createRandomNewsList(numOfNews: 1)
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
    
    func getAllNews() -> [News] {
        return data
    }
    
    func createRandomNews() {
        let news = News.createOneRandomNews()
        self.data.append(news)
    }
    
    
    func updateNumberOfReadsCountRandomly() {
        for i in self.data.indices {
            var news = self.data[i]  // Create a mutable copy of the struct at the current index
                news.numOfReads += Int.random(in: 0...1000)
            self.data[i] = news  // Assign the modified struct back to the collection
        }
    }

}
