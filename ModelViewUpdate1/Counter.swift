//
//  ViewController.swift
//  ModelViewUpdate1
//
//  Created by Jason Larsen on 5/14/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import UIKit

typealias Component = UIViewController
typealias Label = UILabel
typealias Button = UIButton

class Counter: Component {

    
    // MARK: Model
    
    struct Model {
        var count: Int
    }
    
    var model = Model(count: 0) {
        didSet {
            updateView(model)
        }
    }

    
    // MARK: Update
    
    enum Message {
        case increment
        case decrement
    }
    
    func dispatch(message: Message) {
        model = updateModel(message, model: model)
    }
    
    private func updateModel(message: Message, model: Model) -> Model {
        switch message {
        case .increment:
            return Model(count: model.count + 1)
        case .decrement:
            return Model(count: model.count - 1)
        }
    }
    
    
    // MARK: View
    
    @IBOutlet weak var countLabel: Label?
    
    private func updateView(model: Model) {
        countLabel?.text = "\(model.count)"
    }
    
    @IBAction func decrement(sender: AnyObject) {
        dispatch(.decrement)
    }
    
    @IBAction func increment(sender: AnyObject) {
        dispatch(.increment)
    }
    
}

