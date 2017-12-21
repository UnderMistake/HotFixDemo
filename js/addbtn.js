
defineClass('JPRootViewController', {
            addButton: function() {
            var btn = UIButton.alloc().initWithFrame({ x: 0, y: 250, width:200, height: 50 });
            btn.setTitle_forState('thie is a new btn', 0);
            btn.setTitleColor_forState(UIColor.whiteColor(), 0);
            btn.setBackgroundColor(UIColor.blueColor());
            btn.addTarget_action_forControlEvents(self, "pushNewView",1);
            self.view().addSubview(btn);
            },
            excutefile:function(){
            self.addButton();
            },
            pushNewView:function(){
            var ctrl = CreateNewController.alloc().init();
            console.log('push VC');
            self.navigationController().pushViewController_animated(ctrl, NO);
            },
            })

require('UILabel,UIView,UIButton,UIFont, UIColor, UIFont, UIScreen, UIImageView, UIImage')

var screenWidth = UIScreen.mainScreen().bounds().width;
var screenHeight = UIScreen.mainScreen().bounds().height;

defineClass('CreateNewController: UIViewController', {
            viewDidLoad: function() {
            self.super().viewDidLoad();
            self.view().setBackgroundColor(UIColor.whiteColor());
            
            var label = UILabel.alloc().initWithFrame({x: 0, y: 110, width: screenWidth, height: 30});
            label.setText("this is a new ViewController Created by JS");
            label.setTextAlignment(1);
            label.setFont(UIFont.systemFontOfSize(14));
            self.view().addSubview(label);
            //self.addView();
            //            self.addButton();
            },
            })

defineClass('CreateNewController: UIViewController', {
            addView: function() {
            var block = UIView.alloc().initWithFrame({x:90,y:400, width:200,height: 80});
            block.setBackgroundColor(UIColor.grayColor());
            self.view().addSubview(block);
            },
            })

defineClass('CreateNewController: UIViewController',{
            addButton: function() {
            var btn = UIButton.alloc().initWithFrame({x:100,y:100,width: 80,height:40});
            btn.setTitle_forState("button", 0);
            btn.addTarget_action_forControlEvents(self, "changeColor",1);
            btn.setBackgroundColor(UIColor.grayColor());
            self.view().addSubview(btn);
            },
            })

defineClass('CreateNewController: UIViewController',{
            changeColor: function() {
            //No method
            self.addView();
            console.log('touched');
            },
            })


