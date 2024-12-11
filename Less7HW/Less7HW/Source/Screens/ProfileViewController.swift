//
//  ProfileViewController.swift
//  Less7HW
//

//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avaImageView: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var eMailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let dataProvider = DataProviderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadUserDataButtonAction(_ sender: UIButton) {
        dataProvider.loadUserData {[weak self] profileData in
            if let profileVeiviewController = self {
                profileVeiviewController.updateUI(data: profileData)
            }
        }
    }
    
    @IBAction func loadAdminDataButtonAction(_ sender: UIButton) {
        dataProvider.loadAdminData {[weak self] profileData in
            if let profileVeiviewController = self {
                profileVeiviewController.updateUI(data: profileData)
            }
        }
    }
    
    func updateUI(data: ProfileData) {
        avaImageView.image = UIImage(named: "\(data.avatarName)")
        firstNameLabel.text = data.firstName
        lastNameLabel.text = data.lastName
        eMailLabel.text = data.email
        addressLabel.text = data.adderss
    }
}


extension UserModel: ProfileData {
    var avatarName: String { return self.userAvatarName }
    var firstName: String { return self.userFirstName }
    var lastName: String { return self.userLastName }
    var email: String { return self.userEmail }
    var adderss: String { return self.userEmail }
}

extension AdminModel: ProfileData {
    var avatarName: String { return self.adminAvatarName }
    var firstName: String { return self.adminFirstName }
    var lastName: String { return self.adminLastName }
    var email: String { return self.adminEmail }
    var adderss: String { return self.adminEmail }
}
