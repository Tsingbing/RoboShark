import QtQuick 2.0
import QtQuick.Controls 2.2
import com.robosea.opencvshark 1.0
import QtDataVisualization 1.3
import "canvas"

Page {
    width: 1920
    height: 1080
    z: 0

    //background: "#000000"
    //    header: Label {
    //        text: qsTr("Page 1")
    //        font.pixelSize: Qt.application.font.pixelSize * 2
    //        padding: 10
    //    }

    //    Label {
    //        text: qsTr("You are on Page 1.")
    //        anchors.centerIn: parent
    //    }
    OpencvSharkItem {
        id: video
        //x: 0
        //y: 0
        //width: 1920
        //height: 1080
        anchors.fill: parent
        running: true
        imageFlag: 0
        //curFrame:mui_face
    }
    DiscBar {
        id: discBar
        z: 0
    }

    Text {
        id: text1
        color: "#38f443"
        text: qsTr("湿度: ") + serial.hum + " %"
        anchors.rightMargin: 1617 * parent.width / 1920
        anchors.leftMargin: 66 * parent.width / 1920
        anchors.topMargin: 892 * parent.height / 1080
        anchors.bottomMargin: 157 * parent.height / 1080
        anchors.fill: parent
        //text: qbSerialitem.dataSoundAck_FScode
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Text {
        id: text2
        color: "#54f23a"
        text: qsTr("温度: ") + serial.temp + " C"
        anchors.rightMargin: 1617 * parent.width / 1920
        anchors.bottomMargin: 72 * parent.height / 1080
        anchors.leftMargin: 66 * parent.width / 1920
        anchors.topMargin: 977 * parent.height / 1080
        anchors.fill: parent
        font.bold: true
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Text {
        id: text3
        color: "#28f238"
        text: serial.v + qsTr("m/s")
        anchors.rightMargin: 906 * parent.width / 1920
        anchors.bottomMargin: 21 * parent.height / 1080
        anchors.leftMargin: 906 * parent.width / 1920
        horizontalAlignment: Text.AlignHCenter
        anchors.topMargin: 1010 * parent.height / 1080
        anchors.fill: parent
        styleColor: "#7af157"
        font.weight: Font.Thin
        font.capitalization: Font.SmallCaps
        font.family: "Verdana"
        font.bold: true
        font.pixelSize: 46
    }

    Text {
        id: text9
        color: "#38f443"
        text: serial.nowDeepth + "m"
        anchors.rightMargin: 1852 * parent.width / 1920
        anchors.bottomMargin: 508 * parent.height / 1080
        anchors.leftMargin: 9 * parent.width / 1920
        anchors.topMargin: 538 * parent.height / 1080
        anchors.fill: parent
        horizontalAlignment: Text.AlignLeft
        font.bold: true
        font.pixelSize: 30
    }

    Text {
        id: text4
        color: "#ff0000"
        text: joy.frontBack + qsTr("%")
        anchors.rightMargin: 68 * parent.width / 1920
        anchors.bottomMargin: 36 * parent.height / 1080
        anchors.leftMargin: 1724 * parent.width / 1920
        anchors.topMargin: 970 * parent.height / 1080
        anchors.fill: parent
        style: Text.Normal
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.pixelSize: 67
    }
    //    Image {
    //        id: mui_face
    //        anchors.rightMargin: 460 * parent.width / 1920
    //        anchors.bottomMargin: 37 * parent.height / 1080
    //        anchors.leftMargin: 456 * parent.width / 1920
    //        anchors.topMargin: 40 * parent.height / 1080
    //        anchors.fill: parent
    //        //transformOrigin: Item.Center
    //        source: "res/mui_face.svg"
    //        //source: video.curFrame
    //        //        transform: Rotation {
    //        //            origin.x: 500
    //        //            origin.y: 500
    //        //            axis {
    //        //                x: 1
    //        //                y: 0
    //        //                z: 0
    //        //            }
    //        //            //angle: 73 - qbSerialitem.axisY
    //        //            angle: 73
    //        //        }
    //        //        ProgressBar {
    //        //            id: controls
    //        //            anchors.rightMargin: 557
    //        //            anchors.bottomMargin: 479
    //        //            anchors.leftMargin: -386
    //        //            anchors.topMargin: 506
    //        //            anchors.fill: parent
    //        //            //value: ((qbSerialitem.axisZ) + 100) / 2 / 100
    //        //            value: 0.5
    //        //            padding: 2
    //        //            rotation: 90
    //        //            //anchors.top: pie.bottom
    //        //            background: Rectangle {
    //        //                implicitWidth: 630
    //        //                implicitHeight: 10
    //        //                opacity: 0.1
    //        //                radius: 6
    //        //            }

    //        //            contentItem: Item {
    //        //                implicitWidth: 200
    //        //                implicitHeight: 10

    //        //                Rectangle {
    //        //                    width: controls.visualPosition * parent.width
    //        //                    height: parent.height
    //        //                    radius: 6
    //        //                    color: "#ff0000"
    //        //                    opacity: 0.5
    //        //                }
    //        //            }
    //        //        }
    //        //        ProgressBar {
    //        //            id: controls2
    //        //            // value: ((qbSerialitem.axisZ) + 100) / 2 / 100
    //        //            value: 0.5
    //        //            padding: 2
    //        //            x: 645
    //        //            y: 495
    //        //            rotation: -90
    //        //            //anchors.top: pie.bottom
    //        //            background: Rectangle {
    //        //                implicitWidth: 630
    //        //                implicitHeight: 10
    //        //                opacity: 0.1
    //        //                radius: 6
    //        //            }

    //        //            contentItem: Item {
    //        //                implicitWidth: 200
    //        //                implicitHeight: 10

    //        //                Rectangle {
    //        //                    width: controls2.visualPosition * parent.width
    //        //                    height: parent.height
    //        //                    radius: 6
    //        //                    color: "#ff0000"
    //        //                    opacity: 0.5
    //        //                }
    //        //            }
    //        //        }
    //    }
    //    Image {
    //        id: mui_ring2
    //        anchors.rightMargin: 460 * parent.width / 1920
    //        anchors.bottomMargin: 37 * parent.height / 1080
    //        anchors.leftMargin: 456 * parent.width / 1920
    //        anchors.topMargin: 40 * parent.height / 1080
    //        anchors.fill: parent
    //        source: "res/mui_ring2.svg"

    //        //        RotationAnimation on rotation {
    //        //            loops: Animation.Infinite
    //        //            running: true
    //        //            from: 0
    //        //            to: 360
    //        //            duration: 3600 * 2
    //        //        }
    //        //        transform: Rotation {
    //        //            origin.x: 500
    //        //            origin.y: 500
    //        //            axis {
    //        //                x: 1
    //        //                y: 0
    //        //                z: 0
    //        //            }
    //        //            angle: 73
    //        //        }
    //    }

    //    Image {
    //        id: mui_ring
    //        x: 456
    //        width: 1013
    //        anchors.rightMargin: 460 * parent.width / 1920
    //        anchors.leftMargin: 456 * parent.width / 1920
    //        anchors.bottomMargin: 37 * parent.height / 1080
    //        anchors.topMargin: 40 * parent.height / 1080
    //        anchors.fill: parent
    //        source: "res/mui_ring.svg"
    //        //rotation: qbSerialitem.axisX
    //    }

    //    Image {
    //        id: compass_hand
    //        anchors.rightMargin: 9 * parent.width / 1920
    //        anchors.bottomMargin: 619 * parent.height / 1080
    //        anchors.leftMargin: 1547 * parent.width / 1920
    //        anchors.topMargin: 96 * parent.height / 1080
    //        anchors.fill: parent
    //        source: "res/compass_hand.svg"
    //    }

    //    Text {
    //        id: text3
    //        x: 882
    //        y: 1009
    //        width: 131
    //        height: 54
    //        color: "#28f238"
    //        text: qsTr("15M")
    //        styleColor: "#7af157"
    //        font.weight: Font.Thin
    //        font.capitalization: Font.SmallCaps
    //        font.family: "Verdana"
    //        font.bold: true
    //        font.pixelSize: 57
    //    }

    //    Text {
    //        id: text4
    //        x: 1713
    //        y: 960
    //        color: "#16ff98"
    //        text: qsTr("90%")
    //        anchors.rightMargin: 50
    //        anchors.bottomMargin: 48
    //        style: Text.Normal
    //        horizontalAlignment: Text.AlignHCenter
    //        font.bold: true
    //        anchors.leftMargin: 1713 * parent.width / 1920
    //        anchors.topMargin: 960 * parent.height / 1080
    //        anchors.fill: parent
    //        font.pixelSize: 67
    //    }

    //    Image {
    //        id: image2
    //        anchors.rightMargin: 9 * parent.width / 1920
    //        anchors.bottomMargin: 619 * parent.height / 1080
    //        anchors.leftMargin: 1547 * parent.width / 1920
    //        anchors.topMargin: 96 * parent.height / 1080
    //        anchors.fill: parent
    //        source: "res/compass_ring.svg"
    //    }
    Image {
        id: image
        anchors.fill: parent
        source: "res/1.png"
    }

    Text {
        id: text5
        color: "#e10707"
        text: joy.upDown
        anchors.rightMargin: 428 * parent.width / 1920
        anchors.bottomMargin: 525 * parent.height / 1080
        anchors.leftMargin: 1430 * parent.width / 1920
        anchors.topMargin: 525 * parent.height / 1080
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
        font.bold: true
        font.pixelSize: 31
    }

    Text {
        id: text6
        x: -9
        y: 0
        color: "#df0606"
        text: joy.leftRightRound
        horizontalAlignment: Text.AlignHCenter
        anchors.rightMargin: 595 * parent.width / 1920
        anchors.bottomMargin: 546 * parent.height / 1080
        anchors.leftMargin: 1263 * parent.width / 1920
        anchors.topMargin: 502 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 32
        font.bold: true
    }

    Text {
        id: text7
        x: -17
        y: 9
        color: "#df0606"
        text: joy.leftRightRound
        anchors.rightMargin: 1262 * parent.width / 1920
        anchors.bottomMargin: 546 * parent.height / 1080
        anchors.leftMargin: 596 * parent.width / 1920
        anchors.topMargin: 502 * parent.height / 1080
        font.pixelSize: 32
        anchors.fill: parent
        font.bold: true
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text8
        x: 2
        y: -2
        color: "#e10707"
        text: joy.upDown
        font.pixelSize: 31
        anchors.bottomMargin: 525 * parent.height / 1080
        anchors.fill: parent
        anchors.rightMargin: 1431 * parent.width / 1920
        font.bold: true
        anchors.topMargin: 525 * parent.height / 1080
        anchors.leftMargin: 427 * parent.width / 1920
        horizontalAlignment: Text.AlignHCenter
    }
}
