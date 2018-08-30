import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import "canvas"


Page1Form {
    function joyfunction(){

        //if(joy.axis === 0)
        //joy.frontBack = -joy.axisValue * joy.rateSpeed;

        if(joy.axis === 2)
            joy.upDown = -joy.axisValue * joy.rateSpeed;

        if(joy.axis === 3)
            joy.leftRightRound = joy.axisValue * joy.rateSpeed;

        if(joy.axis === 4)
            joy.led = Math.abs(joy.axisValue * joy.rateSpeed);

        if(joy.axis === 5)
            joy.frontBack = - joy.axisValue * joy.rateSpeed;
            if(joy.frontBack > 13)
                joy.frontBack = 13;

        //拍照
        if (joy.button === 1 && joy.buttonPressed)
        {
            //video.cap();
        }

        //定深
        if(joy.button === 24 )
        {
            joy.directional = joy.buttonPressed;
            switch1.checked = joy.buttonPressed;
//            if(joy.buttonPressed)
//            {
//                //switch1.clicked();
//                //            if(switch1.flag <=2)
//                //                switch1.flag++;
//                //            else
//                //                switch1.flag = 0;

//                //            if(switch1.flag === 0)
//                //                switch1.checked = false;
//                //            if(switch1.flag === 2)
//                switch1.checked = false;

//            }
//            else
//            {
//                switch1.checked = true;
//                joy.directional = buttonPressed;
//            }
        }


        //总开关
        if(joy.button === 23 /*&& joy.buttonPressed*/)
        {
            //            if(switch2.flag <=2)
            //                switch2.flag++;
            //            else
            //                switch2.flag = 0;

            //            if(switch2.flag === 0)
            //                switch2.checked = false;
            //            if(switch2.flag === 2)
            //switch2.checked = true;
            joy.openClose = joy.buttonPressed;
            switch2.checked = joy.buttonPressed;
        }else
        {
            //switch2.checked = false;
        }

        if(joy.button === 8 && joy.buttonPressed)
        {
            joy.frontBack = 0;
            joy.leftRightRound = 0;
            joy.upDown = 0;
            joy.directional = 0;
            joy.led = 0;
        }
        if(joy.button === 9 && joy.buttonPressed)
        {
            joy.frontBack = 0;
            joy.leftRightRound = 0;
            joy.upDown = 0;
            joy.directional = 0;
            joy.led = 0;
        }

        joy.stateInfo = joy.frontBack + "::" + joy.upDown + "::" + joy.leftRightRound + "::" + joy.directional +  "::" + joy.led;
    }

    function serialfunction()
    {
        //serial.temperature = serial.jsonObj.

        //定深
        if(switch1.checked)
            joy.directional = 1;
        else
            joy.directional = 0;

    }

    Switch {
        id: switch1
        x: 39
        y: 177
        text: qsTr("定深")
        onCheckedChanged: joy.directional = checked
    }

    Switch {
        id: switch2
        x: 39
        y: 241
        text: qsTr("总开关")
    }

    Text {
        id: text9
        color: "#000000"
        z: 1
        //text: qsTr("***")
        anchors.rightMargin: 1383 * parent.width / 1920
        anchors.bottomMargin: 4 * parent.height / 1080
        anchors.leftMargin: 14 * parent.width / 1920
        anchors.topMargin: 1059 * parent.height / 1080
        anchors.fill: parent
        text: {
            joyfunction()
            return joy.stateInfo + serial.dataState
        }
        font.pixelSize: 18
        //onTextChanged: joyfunction();
    }
    //anchors.fill: parent

    //                mouseArea.onClicked: {
    //                    console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
    //                }
    //        Chart {
    //            x:45
    //            y:245
    //            width: 383
    //            height: 250

    //            MouseArea {
    //                anchors.fill: parent
    //                //onClicked: sub_W.show();
    //            }
    //        }

    Image {
        id: mui_face
        anchors.rightMargin: 460 * parent.width / 1920
        anchors.bottomMargin: 37 * parent.height / 1080
        anchors.leftMargin: 456 * parent.width / 1920
        anchors.topMargin: 40 * parent.height / 1080
        anchors.fill: parent
        //transformOrigin: Item.Center
        source: "res/mui_face.svg"
        //source: video.curFrame
        transform: Rotation {
            origin.x: 500
            origin.y: 500  * parent.height / 1080
            axis {
                x: 1
                y: 0
                z: 0
            }
            angle: 73 - joy.upDown
            //angle: 73
        }

    }

    Image {
        id: mui_ring2
        anchors.rightMargin: 460 * parent.width / 1920
        anchors.bottomMargin: 37 * parent.height / 1080
        anchors.leftMargin: 456 * parent.width / 1920
        anchors.topMargin: 40 * parent.height / 1080
        anchors.fill: parent
        source: "res/mui_ring2.svg"

        RotationAnimation on rotation {
            loops: Animation.Infinite
            running: true
            from: 0
            to: 360
            duration: 3600 * 2
        }
        //                transform: Rotation {
        //                    origin.x: 500
        //                    origin.y: 500
        //                    axis {
        //                        x: 1
        //                        y: 0
        //                        z: 0
        //                    }
        //                    angle: 73
        //                }
    }

    Image {
        id: mui_ring
        x: 456
        width: 1013
        anchors.rightMargin: 460 * parent.width / 1920
        anchors.leftMargin: 456 * parent.width / 1920
        anchors.bottomMargin: 37 * parent.height / 1080
        anchors.topMargin: 40 * parent.height / 1080
        anchors.fill: parent
        source: "res/mui_ring.svg"
        rotation: joy.leftRightRound
    }

    Image {
        id: compass_hand
        anchors.rightMargin: 9 * parent.width / 1920
        anchors.bottomMargin: 619 * parent.height / 1080
        anchors.leftMargin: 1547 * parent.width / 1920
        anchors.topMargin: 96 * parent.height / 1080
        anchors.fill: parent
        source: "res/compass_hand.svg"
        rotation: serial.yaw
//        RotationAnimation on rotation {
//            loops: Animation.Infinite
//            running: true
//            from: 0
//            to: 360
//            duration: 3600 * 2
//        }
    }

    Image {
        id: image2
        anchors.rightMargin: 9 * parent.width / 1920
        anchors.bottomMargin: 619 * parent.height / 1080
        anchors.leftMargin: 1547 * parent.width / 1920
        anchors.topMargin: 96 * parent.height / 1080
        anchors.fill: parent
        source: "res/compass_ring.svg"
    }

    Image {
        id: image
        anchors.fill: parent
        source: "res/1.png"
    }
}

