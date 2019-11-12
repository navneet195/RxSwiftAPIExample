//
//  ArticlesDetailSource.swift
//  RxSwiftAPIExample
//
//  Created by Navnit Baldha on 19/10/19.
//  Copyright © 2019 Navneet. All rights reserved.
//

import UIKit

class ArticlesDetailSource: UIViewController {
    
    var articleModel: ArticleModelData?
    
    // MARK: - implementation UI Decleration
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    // MARK: - implementation loadview
    override func viewDidLoad() {
        
        // Navigation Title Setter
        navigationItem.title = detailViewName
        
        // Lable setter
        lblTitle.text = articleModel?.title
        lblDescription.text = articleModel?.abstract
        lblAuthor.text = articleModel?.byline
        
        // Image Load
        if ((articleModel?.multimedia!.count)! > 0)
        {
            let urlImage:MultimediaApiModel = (articleModel?.multimedia?.last)!
            if let strImage = urlImage.url
            {
                self.imageview?.kf.indicatorType = .activity
                self.imageview?.kf.setImage(with: URL(string: strImage))
            }
        }
        else
        {
            self.imageview.image = UIImage(named: imageName)
        }
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
