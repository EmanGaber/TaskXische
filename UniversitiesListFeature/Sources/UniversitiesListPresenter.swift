//
//  UniversitiesList.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import UIKit
import Common

class UniversitiesListPresenter: UniversitiesListPresenterInterface {
    
    private weak var view: UniversitiesListView?
    private var interactor: UniversitiesListInteractorInterface!
    
    var universitiesListResponse: [UniversitiesModel]?

    
    init(view: UniversitiesListView?, interactor: UniversitiesListInteractorInterface) {
        self.view = view
        self.interactor = interactor

    }
    
    func viewDidLoad() {
        view?.showLoading()
        interactor.fetchUniversities(name: "United Arab Emirates")
    }
    
   
    
    func universitiesCount() -> Int {
        universitiesListResponse?.count ?? 0
    }
    
    func getUniversityInRow(row:Int) -> UniversitiesModel? {
        return universitiesListResponse?[row]
    }
    
    func configureUniversitiesCell(_ cell:UniversityCellDelegate?, _ row: Int)
    {
        cell?.configureCell(universitiesListResponse?[row])

    }
   
    
    
}

extension UniversitiesListPresenter: UniversitiesListInteractorOutput {
    func didGetUniversities(_ universities: [UniversitiesModel]?) {
        DispatchQueue.main.async { [weak self] in
            guard let self else {return}
            self.universitiesListResponse = universities
            self.saveUniversitiesListInDB()
            self.view?.dismissNetworkError()
            self.view?.reloadData()
            self.view?.hideLoading()
        }
    }
    
    
    
    func didFailToGetUniversities(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.hideLoading()
            if error.localizedDescription == "The Internet connection appears to be offline."
            {
                //check DB is empty
                       var allArray = [UniversitiesModel]()
                       allArray = UniversitiesDB.GetAllUniversities()
                       
                       if allArray.count  == 0
                       {
                           // show error
                           //Banner.showError(title: error.localizedDescription)
                           DispatchQueue.main.async {
                               self?.view?.showError(error: error.localizedDescription )
                           }
                       }else
                       {
                           //load from DB
                           self?.reloadOfflineData()
                       }
               
                
            }
            else{
               // Banner.showError(title: error.localizedDescription)
                DispatchQueue.main.async {
                    self?.view?.showError(error: error.localizedDescription )
                }
            }
        }
    }
    
    //load from DB
      func reloadOfflineData() {
          
          var allArray = [UniversitiesModel]()
          allArray = UniversitiesDB.GetAllUniversities()
          
          universitiesListResponse = allArray
          
          DispatchQueue.main.async {
              self.view?.reloadData()
          }
      }

    
    
}


extension UniversitiesListPresenter{
    
    func saveUniversitiesListInDB()
    {
        
        for university in self.universitiesListResponse ?? []
        {
            // Create and Save a Realm Object
            let newUniversity = UniversitiesDB()

            newUniversity.domains.append(objectsIn: university.domains ?? [])
            newUniversity.name = university.name ?? ""
            newUniversity.webPages.append(objectsIn: university.webPages ?? [])
            newUniversity.alphaTwoCode = university.alphaTwoCode ?? ""
            newUniversity.stateProvince = university.stateProvince ?? ""
            newUniversity.country = university.country ?? ""

            UniversitiesDB.SaveOrUpdateUniversity(newObj: newUniversity)

            
        }
        print("all data saved in DB")
    }
   
}
