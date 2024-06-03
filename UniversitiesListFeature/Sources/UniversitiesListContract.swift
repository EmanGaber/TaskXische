//
//  UniversitiesList.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.
//

import Foundation

protocol UniversitiesListView: AnyObject {
    var presenter: UniversitiesListPresenterInterface! { get set }
    
    func showLoading()
    func hideLoading()
    func presentNetworkError()
    func dismissNetworkError()
    func reloadData()
    func updateSearchResults(_ results: [UniversitiesModel]?)
    func showEmptyScreen()
    func hideEmptyScreen()
    func showError(error:String) 

}

protocol UniversitiesListPresenterInterface: AnyObject {
    func viewDidLoad()
    func universitiesCount()-> Int
    func getUniversityInRow(row:Int) -> UniversitiesModel?
    func configureUniversitiesCell(_ cell:UniversityCellDelegate?, _ row: Int)

}

protocol UniversitiesListInteractorInterface: AnyObject {
    var output: UniversitiesListInteractorOutput? { get set }
    func fetchUniversities(name: String)

}

protocol UniversitiesListInteractorOutput: AnyObject {
    func didGetUniversities(_ universitiesModel:[UniversitiesModel]?)
    func didFailToGetUniversities(_ error: Error)

}


