//
//  UniversitiesListViewController.swift
//  TaskXische
//
//  Created by Eman Gaber on 02/06/2024.
//

import UIKit
import Common

public protocol ModuleAViewProtocol{
    func refreshData()
}

public class ModuleAFactory: ModuleAFactoryProtocol{
    
    public init() {
        print("")
    }
    
    public func createModuleA(router: Routable) -> UIViewController {
        let view = UniversitiesListViewController(router: router)
        let interactor = UniversitiesListInteractor()
        let presenter = UniversitiesListPresenter(view: view, interactor: interactor)

        view.presenter = presenter
        interactor.output = presenter

        return view
    }
    
    
}

 class UniversitiesListViewController:UIViewController,ModuleAViewProtocol{
    
    @IBOutlet weak var viewEmpty: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter :UniversitiesListPresenterInterface!
    var router:Routable?
    
    init(router: Routable? = nil) {
        self.router = router
        super.init(nibName: "UniversitiesListViewController", bundle: .module)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshData() {
        //call api
        presenter.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initReachability()
        initTableView()
        presenter.viewDidLoad()
       
    }
    private func initReachability() {
        do {
            try Network.reachability = Reachability(hostname: "www.google.com")
            
        } catch {
            // MARK UI ACTION
        }
    }
}


extension UniversitiesListViewController: UniversitiesListView {
    func updateSearchResults(_ results: [UniversitiesModel]?) {
        reloadData()
        
    }
    
    
    
    func showEmptyScreen() {
        viewEmpty.isHidden = false
//        showEmptyScreen(.universities, view: viewEmpty)
    }
    
    func hideEmptyScreen() {
        viewEmpty.isHidden = true
//        closeEmptyScreen()
    }
    
    
    func showError(error:String) {
        self.makeAlert(error,noCancel: true, closure: {})
    }
    
    func makeAlert(_ message: String, noCancel: Bool? = nil, closure: @escaping () -> Void ) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        let acceptAction = UIAlertAction(title: "OK", style: .default) { (_) -> Void in
            closure()
        }
        
        alert.addAction(acceptAction)
        if noCancel == nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (_) -> Void in
            }
            alert.addAction(cancelAction)
        }
        alert.view.tintColor = .black

        self.present(alert, animated: true, completion: nil)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
   
    
    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            viewEmpty.isHidden = false
            activityIndicator.startAnimating()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            viewEmpty.isHidden = true
            activityIndicator.stopAnimating()
        }
    }
    
    func presentNetworkError() {
        
        // show error
       // showNetworkErrorScreen(self, viewEmpty)
        
    }
    
    func dismissNetworkError() {
        //closeNetworkErrorScreen()
    }
  
}
