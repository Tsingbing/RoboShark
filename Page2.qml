import QtQuick 2.9
import QtQuick.Controls 2.2

Page2Form {

    GroupBox {
        id: groupBox
        x: 12
        y: 180
        width: 268
        height: 327
        title: qsTr("设备开关")

        Column {
            id: column
            //anchors.fill: parent

            Button {
                id: button9
                text: qsTr("打开视频")
                //anchors.top: parent.top
                //anchors.topMargin: 0
                onClicked: video.running = true
            }

            Button {
                id: button10
                text: qsTr("关闭视频")
                //anchors.top: button9.bottom
                //anchors.topMargin: 0
                onClicked: video.running = false
            }

            Button {
                id: button11
                text: qsTr("关闭串口")
                //anchors.top: button10.bottom
                //anchors.topMargin: 0
                onClicked: serial.stop();
            }
            Button {
                id: button14
                text: qsTr("打开发送定时器")
                //anchors.top: button10.bottom
                //anchors.topMargin: 0
                onClicked: t.running = true
            }
            Button {
                id: button15
                text: qsTr("关闭发送定时器")
                //anchors.top: button10.bottom
                //anchors.topMargin: 0
                onClicked: t.running = false
            }

            Row {
                id: row
                width: 240
                height: 40
                //anchors.top: button11.bottom
                //anchors.topMargin: 0
                z: 1

                Button {
                    id: button12
                    text: qsTr("打开串口")
                    onClicked: serial.portName = comboBox.currentText;
                }

                ComboBox {
                    id: comboBox
                    model: ["COM1", "COM2", "COM3", "COM4", "COM5", "COM6", "COM7", "COM8", "COM9", "COM10", "COM11", "COM12", "COM13", "COM14", "COM15", "COM16", "COM17", "COM18", "COM19", "COM20", "COM21"]
                }
            }

            Row {
                id: row1
                width: 240
                height: 40
                //anchors.top: row.bottom
                //anchors.topMargin: 0

                Button {
                    id: button13
                    text: qsTr("发送指令")
                    //anchors.top: row.bottom
                    //anchors.topMargin: 0
                    onClicked: {
                        if(comboBox1.currentIndex === 0){
                            //serial.sendMove(0,0,0,0,0,0);
                            serial.sendMove(joy.frontBack, joy.leftRightRound, joy.led, joy.upDown, 0, joy.directional)
                            console.log("serial.sendMove(1,2,3,4,5,6)");
                        }
                        if(comboBox1.currentIndex === 1){
                            serial.sendState(1,1,1);
                            console.log("serial.sendState(1,1,1)");
                        }

                        if(comboBox1.currentIndex === 2){
                            serial.sendPictureInf();
                            console.log("serial.sendPictureInf()");
                        }

                        if(comboBox1.currentIndex === 3){
                            serial.sendGPSCoord();
                            console.log("serial.sendGPSCoord()");
                        }

                        if(comboBox1.currentIndex === 4){
                            serial.sendLaserControl(1);
                            console.log("serial.sendLaserControl(1)");
                        }
                        if(comboBox1.currentIndex === 5){
                           serial.sendLaserControl(0);
                            console.log("sendLaserControl(0)");
                        }
                        if(comboBox1.currentIndex === 6){
                            serial.sendSoundControl(255,1,1);
                           console.log("serial.sendSoundControl(1,1,1)");
                        }
                    }
                }

                ComboBox {
                    id: comboBox1
                    model: ["运动控制", "状态请求", "目标识别", "GPS请求", "激光开", "激光关","读水听器" ]

                }
            }
        }
    }

    Text {
        id: text1
        color: "#28f238"
        x: 0
        y: 82
        width: 39
        height: 24
        //text: "111"
        z: 1
        text: {
            //serial.sendMove(joy.axisZ, joy.axisX, 3, joy.axisQ, joy.axisY, 0)
            return "axis:" + joy.axis + " | "
                    + "axisValue:" + joy.axisValue + " | "
                    + "button:"+ joy.button + " | "
                    + "buttonPressed:" + joy.buttonPressed + " | ";
        }

        font.pixelSize: 12
    }
    Text {
        id: text2
        color: "#28f238"
        x: 0
        y: 121
        //text: "###"
        // z: 1
        text: {
            //serial.sendMove(joy.axisZ, joy.axisX, 3, joy.axisQ, joy.axisY, joy.button_PATH)
            return "EAC:" + joy.button_EAC + " | "
                    + "RDR:" + joy.button_RDR + " | "
                    + "PATH:"+ joy.button_PATH + " | "
                    + "ALT:" + joy.button_ALT + " | "
                    + "APU:" + joy.button_APU + " | "
                    + "STOP:"+ joy.button_STOP + " | "
                    + "ENGAGE:" + joy.button_ENGAGE + " | ";
        }
        font.pixelSize: 12
    }

    Text {
        id: text3
        color: "#28f238"
        x: 0
        y: 161
        //text: "###"
        // z: 1
        text:"responseData: " + serial.normalInfo
        font.pixelSize: 12
    }

    Text {
        id: text4
        color: "#28f238"
        x: 0
        y: 141
        //text: "###"
        // z: 1
        text: "Info: " + serial.errorInfo
        font.pixelSize: 12
    }

    Timer{
        id:t
        property int test: 0
        interval: 200
        repeat: true
        running: true
        onTriggered:{
            if (joy.openClose){
                if (test++ > 25)
                    test = 0;
                //请求状态参数1s一次，请求水听器参数5s一次，实时发送运动参数300ms一次
                if(test > 20 )
                {
                    serial.sendMove(joy.frontBack, joy.leftRightRound, joy.led, joy.upDown, 0, joy.directional);
                }
                else
                {
                    //serial.sendSoundControl(255,1,0);
                    serial.sendState(1,1,1);
                }
            }
            else
            {
                if (test++ > 25)
                    test = 0;
                //请求状态参数1s一次，请求水听器参数5s一次，实时发送运动参数300ms一次
                if(test > 20 )
                {
                    serial.sendMove(0, 0, 0, 0, 0, 0);
                }else
                {
                    //serial.sendSoundControl(255,1,0);
                    serial.sendState(1,1,1);
                }
            }
        }

    }
}

