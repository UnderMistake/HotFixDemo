require('UIButton');

defineClass('JPRootViewController', {
    addButton: function() {
        var btn = UIButton.alloc().initWithFrame({ x: 0, y: 250, width:100, height: 50 });
        btn.setTitle_forState('thie is a new btn', 0);
        btn.setTitleColor_forState(UIColor.blackColor(), 0);
        btn.setBackgroundColor(UIColor.whiteColor());
        self.view().addSubview(btn);
    },
    _showController: function() {
        self.addButton();
    },
}, {});