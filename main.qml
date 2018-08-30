import QtQuick 2.9
import QtQuick.Controls 2.2

import com.robosea.joystick 1.0
import com.robosea.serialport 1.0

ApplicationWindow {

    visible: true
    width: 1366
    height: 768
    title: qsTr("RoboShark")

    RoundButton {
        id: roundButton
        x: 1878
        y: 9
        z: 1
        width: 34
        height: 31
        text: "X"
        font.pointSize: 10
        onClicked:
        {
            showMaximized();
            //video.imageFlag = 0;
        }
    }

    Button {
        text: "全屏"
        width: 34
        height: 31
        x: 1828
        y: 9
        z: 1
        onClicked:
        {
            showFullScreen();
            //video.imageFlag = 2;
        }
    }

    JoystickItem {
        id: joy
        property int openClose: 0 //前进后退
        property int frontBack: 0 //前进后退
        property int leftRightRound: 0 //左转右转
        property int upDown: 0 //上浮下潜
        property int directional: 0 //// 0:(!定深&&!定向) 1:(定深&&定向) 2:(!定深&&定向) 3:(定深&&定向)
        property int led: 0 //灯光强度
        property double rateSpeed: 1
        property string stateInfo: "***"
        running: true
    }

    SerialPortItem {
        id: serial
        //property var jsonObj: JSON.parse(serial.dataStateAck);
        property string dataState: dataStateAck
        property double direction: 0
        property double hum: 0
        property double nowDeepth: 0
        property double pitch: 0
        property double pointID: 0
        property double point_x: 0
        property double point_y: 0
        property double power: 0
        property double roll: 0
        property double speed: 0
        property double temp: 0
        property double v: 0
        property double yaw: 0
        portName: "COM6"
        waitTimeOut: 500
        onDataStateAckChanged: {
            var jsonObj = JSON.parse(dataStateAck);
            serial.direction = jsonObj["direction"];
            serial.hum = jsonObj["hum"];
            serial.nowDeepth = jsonObj["nowDeepth"];
            serial.pitch = jsonObj["pitch"];
            serial.pointID = jsonObj["pointID"];
            serial.point_x = jsonObj["point_x"];
            serial.point_y = jsonObj["point_y"];
            serial.power = jsonObj["power"];
            serial.roll = jsonObj["roll"];
            serial.speed = jsonObj["speed"];
            serial.temp = jsonObj["temp"];
            serial.v = jsonObj["v"];
            serial.yaw = jsonObj["yaw"];
            console.log( dataStateAck );
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page2 {
        }

        Page3 {

        }
    }

    TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

//        TabButton {
//            text: qsTr("RoboShark")
//        }
//        TabButton {
//            text: qsTr("Setting")
//        }
    }

    Timer {

    }
}
