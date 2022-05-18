//
//  RoomTVCell.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

class RoomTVCell: UITableViewCell {

    @IBOutlet weak var lblRoomNum: UILabel!
    @IBOutlet weak var lblAvailability: UILabel!
    @IBOutlet weak var lblMaxOccupancy: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func didSetData(room: RoomsDataModel) {
        lblRoomNum.text = "Room Number: \(room.id)"
        lblAvailability.text = room.isOccupied ? "Available: Yes" : "Available: No"
        lblMaxOccupancy.text = "Max Occupancy: \(room.maxOccupancy)"
        if let date = room.createdAt.toDate() {
            lblDate.text = "Created Date: " + date
            lblDate.isHidden = false

        }else {
            lblDate.text = ""
            lblDate.isHidden = true
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
