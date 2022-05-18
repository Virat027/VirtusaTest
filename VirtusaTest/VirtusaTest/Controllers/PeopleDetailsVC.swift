//
//  PeopleDetailsVC.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

class PeopleDetailsVC: UIViewController {

    @IBOutlet weak var imgView: LazyImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblFavouriteColor: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblDateHeading: UILabel!

    
    var details: PeopleDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
        
    }
    
    func onViewDidLoad() {
        self.title = "People Details"
        if let detailData = details {
            imgView.loadImage(fromUrl: detailData.avatar, placeHolderImage: "placeholder")
            lblName.text = detailData.firstName + " " + detailData.lastName
            lblJobTitle.text = detailData.jobtitle
            lblID.text = detailData.id
            lblFavouriteColor.text = detailData.favouriteColor
            lblEmail.text = detailData.email
            if let date = detailData.createdAt.toDate() {
                lblDate.text = date
                lblDate.isHidden = false
                lblDateHeading.isHidden = false
                
            }else {
                lblDate.isHidden = true
                lblDateHeading.isHidden = true
            }
        }
    }
}
