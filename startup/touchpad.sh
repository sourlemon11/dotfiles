#!/bin/bash
echo "Running touchpad.sh"

# 3 options below to change keyboard

# setxkbmap -option ctrl:swapcaps

setxkbmap -layout us-caps-ctrl-swap

# (3) permanent ref /etc/udev/hwdb.d/90-caps-to-control.hwdb

#echo 'switched both Tapbuttons to paste (2)'
#xmodmap -e "keycode 135 = Super_R"
#echo 'Right-click menu key is now Super_R'
#xmodmap -e "keycode 133 = Alt_R"
if [ -z "$(lsusb -tv | grep -i "winbond")" ]; then
    synclient LeftEdge=1767
    synclient RightEdge=5397
    synclient TopEdge=1637
    synclient BottomEdge=4451
    synclient FingerLow=25
    synclient FingerHigh=30
    synclient MaxTapTime=180
    synclient MaxTapMove=234
    synclient MaxDoubleTapTime=180
    synclient SingleTapTimeout=180
    synclient ClickTime=100
    synclient EmulateMidButtonTime=75
    synclient EmulateTwoFingerMinZ=282
    synclient EmulateTwoFingerMinW=7
    synclient VertScrollDelta=106
    synclient HorizScrollDelta=100
    synclient VertEdgeScroll=0
    synclient HorizEdgeScroll=1
    synclient CornerCoasting=0
    synclient VertTwoFingerScroll=1
    synclient HorizTwoFingerScroll=0
    synclient MinSpeed=1
    synclient MaxSpeed=1.75
    synclient AccelFactor=0.0374602
    synclient TouchpadOff=0
    synclient LockedDrags=0
    synclient LockedDragTimeout=5000
    synclient RTCornerButton=0
    synclient RBCornerButton=0
    synclient LTCornerButton=0
    synclient LBCornerButton=0
    synclient TapButton1=1
    synclient TapButton2=2
    synclient TapButton3=2
    synclient ClickFinger1=1
    synclient ClickFinger2=1
    synclient ClickFinger3=1
    synclient CircularScrolling=0
    synclient CircScrollDelta=0.1
    synclient CircScrollTrigger=0
    synclient CircularPad=0
    synclient PalmDetect=1
    synclient PalmMinWidth=10
    synclient PalmMinZ=200
    synclient CoastingSpeed=20
    synclient CoastingFriction=50
    synclient PressureMotionMinZ=30
    synclient PressureMotionMaxZ=160
    synclient PressureMotionMinFactor=1
    synclient PressureMotionMaxFactor=1
    synclient GrabEventDevice=0
    synclient TapAndDragGesture=1
    synclient AreaLeftEdge=0
    synclient AreaRightEdge=0
    synclient AreaTopEdge=0
    synclient AreaBottomEdge=0
    synclient HorizHysteresis=26
    synclient VertHysteresis=26
    synclient ClickPad=0
fi
