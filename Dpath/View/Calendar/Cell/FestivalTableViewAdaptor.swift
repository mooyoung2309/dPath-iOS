//
//  FestivalTableViewAdaptor.swift
//  Dpath
//
//  Created by 송영모 on 2022/05/21.
//

import UIKit

class FestivalTableViewAdaptor: NSObject, UITableViewDelegate, UITableViewDataSource {
    weak var superVC: UIViewController!
    let festivals: [String] = ["성신여대 대동제", "세종대 봄축제", "가천대 여름축제"]
    
    init(_ superVC: UIViewController) {
        super.init()
        self.superVC = superVC
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return festivals.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FestivalTableViewCell.identifier, for: indexPath) as! FestivalTableViewCell
        cell.update(festival: festivals[indexPath.section])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Log(indexPath)
    }
}
