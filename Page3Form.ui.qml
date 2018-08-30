import QtQuick 2.4

Item {
    width: 1920
    height: 1080
    Image {
        id: image
        anchors.fill: parent
        source: "res/3.png"
    }

    Text {
        id: text11
        x: 178
        y: 972
        color: "#f46666"
        text: qsTr("hum: ") + serial.hum
        anchors.rightMargin: 1187 * parent.width / 1920
        anchors.bottomMargin: 916 * parent.height / 1080
        anchors.leftMargin: 318 * parent.width / 1920
        anchors.topMargin: 143 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text10
        color: "#f46666"
        text: qsTr("temp: ") + serial.temp
        anchors.rightMargin: 597 * parent.width / 1920
        anchors.bottomMargin: 85 * parent.height / 1080
        anchors.leftMargin: 876 * parent.width / 1920
        anchors.topMargin: 970 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text9
        color: "#f46666"
        text: qsTr("direction: ") + serial.direction
        anchors.rightMargin: 508 * parent.width / 1920
        anchors.bottomMargin: 22 * parent.height / 1080
        anchors.leftMargin: 876 * parent.width / 1920
        anchors.topMargin: 1033 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text8
        color: "#f46666"
        text: qsTr("pitch: ") + serial.pitch
        anchors.rightMargin: 1322 * parent.width / 1920
        anchors.bottomMargin: 83 * parent.height / 1080
        anchors.leftMargin: 136 * parent.width / 1920
        anchors.topMargin: 970 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text7
        color: "#f46666"
        text: qsTr("roll: ") + serial.roll
        anchors.rightMargin: 1344 * parent.width / 1920
        anchors.bottomMargin: 17 * parent.height / 1080
        anchors.leftMargin: 136 * parent.width / 1920
        anchors.topMargin: 1033 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text6
        color: "#f46666"
        text: qsTr("speed: ") + serial.speed
        anchors.rightMargin: 587 * parent.width / 1920
        anchors.bottomMargin: 144 * parent.height / 1080
        anchors.leftMargin: 876 * parent.width / 1920
        anchors.topMargin: 910 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text5
        color: "#f46666"
        text: qsTr("nowDeepth: ") + serial.nowDeepth
        anchors.rightMargin: 1043 * parent.width / 1920
        anchors.bottomMargin: 398 * parent.height / 1080
        anchors.leftMargin: 336 * parent.width / 1920
        anchors.topMargin: 657 * parent.height / 1080
        anchors.fill: parent
        font.pixelSize: 19
    }

    Text {
        id: text4
        color: "#f46666"
        text: qsTr("power: ") + serial.power
        anchors.rightMargin: 1287 * parent.width / 1920
        anchors.leftMargin: 176 * parent.height / 1080
        anchors.bottomMargin: 656 * parent.width / 1920
        anchors.topMargin: 395 * parent.height / 1080
        anchors.fill: parent

        font.pixelSize: 19
    }
}
