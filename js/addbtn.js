require("UIButton");

defineClass("HomeViewController", {
    addButton: function() {
        var btn = UIButton.alloc().initWithFrame({ x: 0, y: 0, width: 80, height: 40 });
        btn.setTitle_forState("这是一个新增的按钮", 0);
        self.view().addSubview(btn);
    },
    _setupFunction: function() {
        self.addButton();
    },
}, {});