//
//  ViewController.swift
//  ch24
//
//  Created by Min on 2018. 2. 21..
//  Copyright © 2018년 Macbook. All rights reserved.
//

import UIKit
import RealmSwift

class Todo : Object { //realm 만들기 위해서는 Object를 상속받아야함.
    @objc dynamic var title : String! //프로퍼티는 dynamic var로 선언
    @objc dynamic var dueDate : Date!
} //모델 생성

class ViewController: UIViewController {
 
    var realm : Realm! //데이터베이스 생성
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm() //객체 생성(throw가 있기 때문에 try!를 써주어야함.
        print("Home : \(NSHomeDirectory())")
        //print("Realm path: \(Realm.Configuration.defaultConfiguration.fileURL!)")
    }

    override func viewWillAppear(_ animated: Bool) {
        add(title: "UIKit Study", due: Date())
        add(title: "Network Study", due: Date())
    }
    
    func add(title : String, due date : Date) { //데이터 추가(데이터베이스에 저장)
        
        let todo = Todo() //todo 객체 생성
        todo.title = title
        todo.dueDate = date
        
        try! realm.write {
            realm.add(todo) //데이터베이스에 반영됨
        }
    }
}

