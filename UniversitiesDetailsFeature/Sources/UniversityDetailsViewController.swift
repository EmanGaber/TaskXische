//
//  UniversityDetailsViewController.swift
//  TaskXische
//
//  Created by Eman Gaber on 02/06/2024.
//

import UIKit
import Common


public class UniversitiesDetailsFactory: UniversitiesDetailsFactoryProtocol{
    
    public init() {
        print("")
    }
    
    public func createUniversitiesDetails(router:Routable, universityName: String,
                              universityWebPages: [String],
                              universityAlphaTwoCode: String,
                              universityStateProvince: String,
                              universityCountry: String) -> UIViewController {
        
        let view =  UniversityDetailsViewController(router: router, universityName: universityName,universityWebPages:universityWebPages,universityAlphaTwoCode:  universityAlphaTwoCode,universityStateProvince: universityStateProvince,universityCountry:universityCountry)
        
        let interactor = UniversityDetailsInteractor()
        let presenter = UniversityDetailsPresenter(view: view, interactor: interactor)
        
        view.presenter = presenter
        
        return view
    }
    
    
}

class UniversityDetailsViewController:UIViewController{
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stateLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryCodeLbl: UILabel!
    @IBOutlet weak var webpageLbl: UILabel!
    
    
    var universityName: String?
    var universityWebPages: [String]?
    var universityAlphaTwoCode: String?
    var universityStateProvince: String?
    var universityCountry: String?
    
    var refreshCallBack: (() -> Void)?
    var presenter :UniversityDetailsPresenterInterface!
    var router:Routable?
    
    public init(router: Routable? = nil, universityName: String,
                universityWebPages: [String],
                universityAlphaTwoCode: String,
                universityStateProvince: String,
                universityCountry: String) {
       
        self.router = router
        super.init(nibName: "UniversityDetailsViewController", bundle: .module)
        
        self.universityName = universityName
        self.universityWebPages = universityWebPages
        self.universityAlphaTwoCode = universityAlphaTwoCode
        self.universityStateProvince = universityStateProvince
        self.universityCountry = universityCountry
    }
    
    
    
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "University Details"

        
        //fill university Details in view
        self.presenter.updateView(universityName: universityName,universityWebPages:universityWebPages,universityAlphaTwoCode:  universityAlphaTwoCode,universityStateProvince: universityStateProvince,universityCountry:universityCountry)
    }
    
    @IBAction func actionRefresh(_ sender: UIButton) {
        //back and refresh
        router?.popToUniversitiesList(from: self)
    }
}
