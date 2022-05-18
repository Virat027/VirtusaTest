//
//  PeopleVC.swift
//  VirtusaTest
//
//  Created by Virat on 5/17/22.
//

import UIKit

class PeopleVC: UIViewController {
    
    @IBOutlet weak var peopleTV: UITableView!

    lazy var viewModel = PeopleViewModel()
    var peopleList: [PeopleDataModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
       
    }
    
    func onViewDidLoad() {
        self.title = "People"
        viewModel.getPeople(with: EndPoints.getPeople) {[weak self] (data, error) in
            if let people = data {
                self?.updateUI(people)
            }
        }
    }
    
    func updateUI(_ people: [PeopleDataModel]) {
        peopleList = people
        DispatchQueue.main.async { [weak self] in
            self?.peopleTV.reloadData()
        
        }
    }
}

//MARK:- TableView DataSource and Delegates
extension PeopleVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PeopleTVCell.identifier) as! PeopleTVCell
        cell.lblName.text = peopleList[indexPath.row].firstName + " " + peopleList[indexPath.row].lastName
        cell.imgView.loadImage(fromUrl: peopleList[indexPath.row].avatar, placeHolderImage: "placeholder")
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.9385310914, green: 0.9385310914, blue: 0.9385310914, alpha: 1) : .white
        

        cell.accessoryType = .detailButton
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = Storyboards.Main.instantiateVC(PeopleDetailsVC.self) else { return }
        vc.details = peopleList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
}

