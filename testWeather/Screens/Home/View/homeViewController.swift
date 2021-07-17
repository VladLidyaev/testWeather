//
//  ViewController.swift
//  testWeather
//
//  Created by Vlad on 17.07.2021.
//

/*
 Стартовый экран – таблица со списком из 10 городов (обязательно показать температуру, название города и текущие погодные условия). При желании можно сделать этот список редактируемым. Над таблицей есть SearchBar, в нем пользователь может искать интересующие его города. При нажатии на ячейку пользователь попадает на экран подробной информации,
 Экран подробной информации – после ввода города в SearchBar, приложение должно отобразить экран на котором будет подробная информация о выбранном городе. Дизайн и какую информацию необходимо отображать – решайте вы сами.
 Ссылка на API – https://yandex.ru/dev/weather/doc/dg/concepts/about-docpage/
 */

import UIKit

class homeViewController: UIViewController {
    
    //  CONSTANTS
    private let conf = configs.shared
    
    //  UI ELEMENTS
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparingUI()
        layoutOfElements()
    }
    
    private func preparingUI() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = conf.homeTitle
        self.view.backgroundColor = conf.backgroundColor
    }
    
    private func layoutOfElements() {
        
        //  Safe Window Area View
        let windowView = UIView()
        self.view.addSubview(windowView)
        windowView.translatesAutoresizingMaskIntoConstraints = false
        windowView.backgroundColor = nil
        let margins = self.view.layoutMarginsGuide
        NSLayoutConstraint.activate([
            windowView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            windowView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ])
        let guide = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            windowView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: windowView.bottomAnchor, multiplier: 1.0)
        ])
        
        
        //  Search Block
        let searchContainer = UIView()
        windowView.addSubview(searchContainer)
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: searchContainer, attribute: .top, relatedBy: .equal, toItem: windowView, attribute: .top, multiplier: 1.0, constant: .zero),
            NSLayoutConstraint(item: searchContainer, attribute: .left, relatedBy: .equal, toItem: windowView, attribute: .left, multiplier: 1.0, constant: .zero),
            NSLayoutConstraint(item: searchContainer, attribute: .right, relatedBy: .equal, toItem: windowView, attribute: .right, multiplier: 1.0, constant: .zero),
            NSLayoutConstraint(item: searchContainer, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: conf.searchBlockHeight)
        ])
        
        
        let searchBlock = UIView()
        searchBlock.backgroundColor = conf.detailsColor
        searchBlock.layer.cornerRadius = conf.radius
        searchContainer.addSubview(searchBlock)
        searchBlock.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: searchBlock, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: conf.searchHeight),
            NSLayoutConstraint(item: searchBlock, attribute: .left, relatedBy: .equal, toItem: searchContainer, attribute: .left, multiplier: 1.0, constant: conf.spacing),
            NSLayoutConstraint(item: searchBlock, attribute: .right, relatedBy: .equal, toItem: searchContainer, attribute: .right, multiplier: 1.0, constant: -conf.spacing),
            NSLayoutConstraint(item: searchBlock, attribute: .centerY, relatedBy: .equal, toItem: searchContainer, attribute: .centerY, multiplier: 1.0, constant: .zero)
        ])
        
        let searchBackground = UIView()
        searchBackground.backgroundColor = conf.backgroundColor
        searchBackground.layer.cornerRadius = conf.radius
        searchBlock.addSubview(searchBackground)
        searchBackground.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: searchBackground, attribute: .top, relatedBy: .equal, toItem: searchBlock, attribute: .top, multiplier: 1.0, constant: conf.searchBorder),
            NSLayoutConstraint(item: searchBackground, attribute: .right, relatedBy: .equal, toItem: searchBlock, attribute: .right, multiplier: 1.0, constant: -conf.searchBorder),
            NSLayoutConstraint(item: searchBackground, attribute: .bottom, relatedBy: .equal, toItem: searchBlock, attribute: .bottom, multiplier: 1.0, constant: -conf.searchBorder),
            NSLayoutConstraint(item: searchBackground, attribute: .left, relatedBy: .equal, toItem: searchBlock, attribute: .left, multiplier: 1.0, constant: conf.searchHeight)
        ])
        
        let searchTextField = UITextField()
        searchTextField.placeholder = conf.homePlaceHolder
        searchTextField.backgroundColor = conf.backgroundColor
        searchTextField.layer.cornerRadius = conf.radius
        searchBackground.addSubview(searchTextField)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: searchTextField, attribute: .top, relatedBy: .equal, toItem: searchBackground, attribute: .top, multiplier: 1.0, constant: conf.searchSpacing),
            NSLayoutConstraint(item: searchTextField, attribute: .bottom, relatedBy: .equal, toItem: searchBackground, attribute: .bottom, multiplier: 1.0, constant: -conf.searchSpacing),
            NSLayoutConstraint(item: searchTextField, attribute: .left, relatedBy: .equal, toItem: searchBackground, attribute: .left, multiplier: 1.0, constant: conf.searchSpacing),
            NSLayoutConstraint(item: searchTextField, attribute: .right, relatedBy: .equal, toItem: searchBackground, attribute: .right, multiplier: 1.0, constant: -conf.searchSpacing)
        ])
        
        let clearButton = UIButton()
        clearButton.backgroundColor = .red
        searchBlock.addSubview(clearButton)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: clearButton, attribute: .top, relatedBy: .equal, toItem: searchBlock, attribute: .top, multiplier: 1.0, constant: conf.searchBorder),
            NSLayoutConstraint(item: clearButton, attribute: .left, relatedBy: .equal, toItem: searchBlock, attribute: .left, multiplier: 1.0, constant: conf.searchBorder),
            NSLayoutConstraint(item: clearButton, attribute: .bottom, relatedBy: .equal, toItem: searchBlock, attribute: .bottom, multiplier: 1.0, constant: -conf.searchBorder),
            NSLayoutConstraint(item: clearButton, attribute: .right, relatedBy: .equal, toItem: searchBackground, attribute: .left, multiplier: 1.0, constant: -conf.searchBorder)
        ])
        
        
        
        //  Search result table view
        let resultsTableView = UITableView()
        resultsTableView.backgroundColor = .blue
        windowView.addSubview(resultsTableView)
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: resultsTableView, attribute: .top, relatedBy: .equal, toItem: searchContainer, attribute: .bottom, multiplier: 1.0, constant: conf.spacing),
            NSLayoutConstraint(item: resultsTableView, attribute: .bottom, relatedBy: .equal, toItem: windowView, attribute: .bottom, multiplier: 1.0, constant: .zero),
            NSLayoutConstraint(item: resultsTableView, attribute: .left, relatedBy: .equal, toItem: windowView, attribute: .left, multiplier: 1.0, constant: .zero),
            NSLayoutConstraint(item: resultsTableView, attribute: .right, relatedBy: .equal, toItem: windowView, attribute: .right, multiplier: 1.0, constant: .zero),
        ])
    }
}

