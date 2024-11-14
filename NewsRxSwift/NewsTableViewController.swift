//
//  NewsTableViewController.swift
//  NewsRxSwift
//
//  Created by Adlet Zhantassov on 14.11.2024.
//

import UIKit
import RxCocoa
import RxSwift

final class NewsTableViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let disposeBag = DisposeBag()
    private var articles = [Article]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        setupNavBar()
        populateNews()
    }
    
    // MARK: - Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found") }
                cell.titleLabel.text = articles[indexPath.row].title
                cell.descriptionLabel.text = articles[indexPath.row].description
                return cell
    }
    
    func populateNews() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=4e1fb1a5145c466b986d9be131ef901e")!
//        Observable.just(url)
//            .flatMap { url -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//            }
//            .map { data -> [Article]? in
//                return try? JSONDecoder().decode(ArticleList.self, from: data).articles
//            }
//            .subscribe(onNext: { [weak self] articles in
//                self?.articles = articles ?? []
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            }).disposed(by: disposeBag)
    }
    
    func setupNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        // Create a UINavigationBarAppearance instance to handle non-transparent background
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 47/255, green: 54/255, blue: 64/255, alpha: 1.0)
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        // Apply appearance settings
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}
