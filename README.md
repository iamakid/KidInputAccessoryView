# KidIputAccessoryView

![Watch the video](https://github.com/iamakid/KidIputAccessoryView/blob/master/inputAccessoryView_Demo.gif?raw=true)

## Function
1. A chatroom-like input view (by inputAccessoryView)
    * would always be shown on the bottom of the viewController
2. Let the bottom of inputAccessoryView would expand until the safearea zone to the device's bottom
3. When keyboard is triggered, the height of inputAccessoryView wouldn't include the safearea height


## Help Needed

I faced a problem that it would show the warning message below everytime when I call `inputTextField.resignFirstResponder()`, but I can't find out a good solution to solve this warning.

If someone had faced the some problem and solved it successfully, please teach me, I would appreciate it very much.
my mail is kid@csie.io

```=
KidInputAccessoryView[97971:3770390] [View] First responder warning: '<KidInputAccessoryView.kInputAccessoryView: 0x7fd9e2d1c2a0; frame = (0 0; 414 100); layer = <CALayer: 0x600003eb48a0>>' rejected resignFirstResponder when being removed from hierarchy
```
