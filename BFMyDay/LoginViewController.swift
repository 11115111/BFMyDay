//
//  ViewController.swift
//  BFStory
//
//  Created by panbc on 16/6/8.
//  Copyright © 2016年 panbc. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBOutlet weak var pwText: JVFloatLabeledTextField!
    @IBOutlet weak var floatPasswd: UIButton!
    
    @IBOutlet weak var userText: JVFloatLabeledTextField!
    @IBOutlet weak var floatUserName: UIButton!
    
    @IBAction func onLogin(sender: AnyObject) {
        loginBtn.setTitle("登录中...", forState: UIControlState.Normal)
        loginBtn.enabled = false
        if userText.text == nil || userText.text!.isEmpty {
            floatUserName.hidden = false;
            floatUserName.alpha = 0;
            UIView.animateWithDuration(0.3, animations: {
                self.floatUserName.alpha = 1;
            })
            
        }else if pwText.text == nil || pwText.text!.isEmpty {
            floatPasswd.hidden = false;
            floatPasswd.alpha = 0;
            UIView.animateWithDuration(0.3, animations: {
                self.floatPasswd.alpha = 1;
            })
        } else {
            userText.enabled = false
            pwText.enabled = false
            let networkManager = AFHTTPSessionManager(baseURL: NSURL.init(string: "http://120.76.73.209:8888"))
            let param = ["username":self.userText.text!, "password":self.pwText.text!]
            networkManager.GET("/user/login/", parameters: param, success: { (task,repsonse) in
                let json = repsonse!
                let tmp = json["message"] as! String
                print(tmp)
                if(json["code"] as! NSNumber == 0){
                    let data =  json["data"] as! NSDictionary
                    let userInfo = data["userinfo"] as! NSDictionary
                    PreferenceUtil.sessionID = userInfo["sessionid"] as! String?
                    let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("startvc")
                    controller.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
                    self.presentViewController(controller, animated: true, completion:nil)
                }
                self.refreshUI(true, titleLogin: "登录")
                }, failure: { (task, error) in
                    self.refreshUI(true, titleLogin: "登录")
            })
            
            return
        }
        self.refreshUI(true, titleLogin: "登录")
        
    }
    
    func refreshUI(enableLoginBtn:Bool, titleLogin:String) {
        self.loginBtn.setTitle(titleLogin, forState: UIControlState.Normal)
        self.loginBtn.enabled = enableLoginBtn
        userText.enabled = true
        pwText.enabled = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btnLayer  = loginBtn.layer;
        btnLayer.cornerRadius = 5;
        btnLayer.borderColor = loginBtn.tintColor.CGColor;
        btnLayer.borderWidth = 1;
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(LoginViewController.textFieldBeginEditing), name:UITextFieldTextDidBeginEditingNotification, object: userText)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(LoginViewController.textFieldBeginEditing), name:UITextFieldTextDidBeginEditingNotification, object: pwText)
    }
    
    func textFieldBeginEditing(){
        UIView.animateWithDuration(0.3, animations: {
            self.floatUserName.alpha = 0;
        })
        UIView.animateWithDuration(0.3, animations: {
            self.floatPasswd.alpha = 0;
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

